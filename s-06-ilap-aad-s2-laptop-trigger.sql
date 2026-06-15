--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para LAPTOP (Nodos remotos F1, F3, F4)

create or replace trigger t_dml_laptop
instead of insert or update or delete on laptop
declare
    v_primer_digito char(1);
begin
    case
        when inserting then
            -- Extraemos el primer dígito del número de serie
            v_primer_digito := substr(:new.num_serie, 1, 1);
            
            /* 1. Inserción en fragmento horizontal correspondiente */
            if v_primer_digito in ('0', '1') then
                -- NORTE (F1)
                insert into laptop_f1(laptop_id, laptop_reemplazo_id, num_serie, nombre, descripcion, ram_mb, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id) 
                values (:new.laptop_id, :new.laptop_reemplazo_id, :new.num_serie, :new.nombre, :new.descripcion, :new.ram_mb, :new.caracteristicas_extras, :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id, :new.tipo_monitor_id);
                
            elsif v_primer_digito in ('2', '3') then
                -- SUR (F2)
                insert into laptop_f2(laptop_id, laptop_reemplazo_id, num_serie, nombre, descripcion, ram_mb, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id) 
                values (:new.laptop_id, :new.laptop_reemplazo_id, :new.num_serie, :new.nombre, :new.descripcion, :new.ram_mb, :new.caracteristicas_extras, :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id, :new.tipo_monitor_id);
                
            elsif v_primer_digito in ('4', '5') then
                -- OESTE (F3)
                insert into laptop_f3(laptop_id, laptop_reemplazo_id, num_serie, nombre, descripcion, ram_mb, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id) 
                values (:new.laptop_id, :new.laptop_reemplazo_id, :new.num_serie, :new.nombre, :new.descripcion, :new.ram_mb, :new.caracteristicas_extras, :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id, :new.tipo_monitor_id);
                
            elsif v_primer_digito in ('6', '7', '8', '9') then
                -- ESTE (F4)
                insert into laptop_f4(laptop_id, laptop_reemplazo_id, num_serie, nombre, descripcion, ram_mb, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id) 
                values (:new.laptop_id, :new.laptop_reemplazo_id, :new.num_serie, :new.nombre, :new.descripcion, :new.ram_mb, :new.caracteristicas_extras, :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id, :new.tipo_monitor_id);
                
            else
                -- Si no es un dígito entre 0 y 9, no cumple con la fragmentación primaria
                raise_application_error(-20010, 'El registro que se intenta insertar no cumple con el esquema de fragmentación horizontal primaria de LAPTOP.');
            end if;

            /* 2. Manejo de BLOB: Inserción Vertical Local en el Sur (F5) */
            insert into laptop_f5(laptop_id, foto) values (:new.laptop_id, :new.foto);
        when deleting then
            delete from laptop_f1 where laptop_id = :old.laptop_id;
            delete from laptop_f2 where laptop_id = :old.laptop_id;
            delete from laptop_f3 where laptop_id = :old.laptop_id;
            delete from laptop_f4 where laptop_id = :old.laptop_id;
            delete from laptop_f5 where laptop_id = :old.laptop_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors