--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para fragmentación horizontal primaria de SUCURSAL

create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
declare
begin
    case
        when inserting then
            /* TODO: Ajustar la regla de fragmentación exacta. Se asume un prefijo de CLAVE */
            if substr(:new.clave, 1, 2) = 'NO' then
                insert into sucursal_f1(sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url) 
                values (:new.sucursal_id, :new.es_venta, :new.es_taller, :new.clave, :new.nombre, :new.latitud, :new.longitud, :new.url);
            elsif substr(:new.clave, 1, 2) = 'EA' then
                insert into sucursal_f2(...) values (...);
            elsif substr(:new.clave, 1, 2) = 'WE' then
                insert into sucursal_f3(...) values (...);
            elsif substr(:new.clave, 1, 2) = 'SO' then
                insert into sucursal_f4(...) values (...);
            else
                raise_application_error(-20010, 'El registro que se intenta insertar no cumple con el esquema de fragmentación horizontal primaria.');
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