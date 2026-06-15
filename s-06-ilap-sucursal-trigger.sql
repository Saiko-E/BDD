--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para fragmentación horizontal primaria de SUCURSAL

create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
declare
begin
    case
        when inserting then
            
            if :new.es_taller not in (0, 1) or :new.es_venta not in (0, 1) then
                raise_application_error(-20010, 'Error: Las banderas es_taller y es_venta deben ser 0 o 1.');
            end if;

            -- Regla B: No pueden ser ambas cero
            if :new.es_taller = 0 and :new.es_venta = 0 then
                raise_application_error(-20010, 'Error: La sucursal debe ser taller o venta, no puede tener ambas en 0.');
            end if;

            -- Regla C: La zona en la clave debe ser válida (NO, EA, WS, SO)
            if substr(:new.clave, 3, 2) not in ('NO', 'EA', 'WS', 'SO') then
                raise_application_error(-20010, 'Error: La zona en la clave de la sucursal es invalida.');
            end if;

            -- Regla 1: Ambas funciones (venta y taller) O zona 'NO' van al Norte (F1)
            if (:new.es_venta = '1' and :new.es_taller = '1') or substr(:new.clave, 3, 2) = 'NO' then
                insert into sucursal_f1(sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url) 
                values (:new.sucursal_id, :new.es_venta, :new.es_taller, :new.clave, :new.nombre, :new.latitud, :new.longitud, :new.url);
                
            -- Regla 2: Zona 'EA' va al Este (F2)
            elsif substr(:new.clave, 3, 2) = 'EA' then
                insert into sucursal_f2(sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url) 
                values (:new.sucursal_id, :new.es_venta, :new.es_taller, :new.clave, :new.nombre, :new.latitud, :new.longitud, :new.url);
                
            -- Regla 3: Zona 'WS' va al Oeste (F3)
            elsif substr(:new.clave, 3, 2) = 'WS' then
                insert into sucursal_f3(sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url) 
                values (:new.sucursal_id, :new.es_venta, :new.es_taller, :new.clave, :new.nombre, :new.latitud, :new.longitud, :new.url);
                
            -- Regla 4: Zona 'SO' va al Sur (F4)
            elsif substr(:new.clave, 3, 2) = 'SO' then
                insert into sucursal_f4(sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url) 
                values (:new.sucursal_id, :new.es_venta, :new.es_taller, :new.clave, :new.nombre, :new.latitud, :new.longitud, :new.url);
                
            -- Manejo de errores de fragmentación
            else
                raise_application_error(-20010, 'El registro que se intenta insertar no cumple con el esquema de fragmentación horizontal primaria de SUCURSAL.');
            end if;

        when deleting then
            -- Se intenta borrar en todos los fragmentos (solo existirá en uno)
            delete from sucursal_f1 where sucursal_id = :old.sucursal_id;
            delete from sucursal_f2 where sucursal_id = :old.sucursal_id;
            delete from sucursal_f3 where sucursal_id = :old.sucursal_id;
            delete from sucursal_f4 where sucursal_id = :old.sucursal_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors