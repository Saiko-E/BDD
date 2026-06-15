--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para fragmentación horizontal derivada (SUCURSAL_VENTA)

create or replace trigger t_dml_sucursal_venta
instead of insert or update or delete on sucursal_venta
declare
    v_count number;
begin
    case
        when inserting then
            -- Buscamos al padre en el fragmento 1
            select count(*) into v_count from sucursal_f1 where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into sucursal_venta_f1(sucursal_id, hora_apertura, hora_cierre) 
                values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
            else
                -- Buscamos al padre en el fragmento 2
                select count(*) into v_count from sucursal_f2 where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    insert into sucursal_venta_f2(sucursal_id, hora_apertura, hora_cierre) 
                    values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                else
                    -- Buscamos al padre en el fragmento 3
                    select count(*) into v_count from sucursal_f3 where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        insert into sucursal_venta_f3(sucursal_id, hora_apertura, hora_cierre) 
                        values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                    else
                        -- Buscamos al padre en el fragmento 4
                        select count(*) into v_count from sucursal_f4 where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            insert into sucursal_venta_f4(sucursal_id, hora_apertura, hora_cierre) 
                            values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                        else
                            -- Si no está en ningún fragmento padre, lanzamos el error de derivación
                            raise_application_error(-20020, 'El registro que se intenta insertar no cumple con el esquema de fragmentación horizontal derivada. Padre no encontrado.');
                        end if;
                    end if;
                end if;
            end if;

        when deleting then
            -- Intentamos borrar en todos los fragmentos
            delete from sucursal_venta_f1 where sucursal_id = :old.sucursal_id;
            delete from sucursal_venta_f2 where sucursal_id = :old.sucursal_id;
            delete from sucursal_venta_f3 where sucursal_id = :old.sucursal_id;
            delete from sucursal_venta_f4 where sucursal_id = :old.sucursal_id;

        when updating then
            -- Bloqueamos las actualizaciones según los requerimientos
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors