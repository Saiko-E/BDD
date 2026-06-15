--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para SUCURSAL_VENTA (Nodo Este - ensbdd_s2)

create or replace trigger t_dml_sucursal_venta
instead of insert or update or delete on sucursal_venta
declare
    v_count number;
begin
    case
        when inserting then
            -- 1. LOCAL: Busca en el Este (F2)
            select count(*) into v_count from sucursal_f2 where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into sucursal_venta_f2(sucursal_id, hora_apertura, hora_cierre) 
                values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
            else
                -- 2. REMOTO: Busca en el Norte (F1)
                select count(*) into v_count from sucursal_f1 where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    insert into sucursal_venta_f1(sucursal_id, hora_apertura, hora_cierre) 
                    values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                else
                    -- 3. REMOTO: Busca en el Oeste (F3)
                    select count(*) into v_count from sucursal_f3 where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        insert into sucursal_venta_f3(sucursal_id, hora_apertura, hora_cierre) 
                        values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                    else
                        -- 4. REMOTO: Busca en el Sur (F4)
                        select count(*) into v_count from sucursal_f4 where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            insert into sucursal_venta_f4(sucursal_id, hora_apertura, hora_cierre) 
                            values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                        else
                            raise_application_error(-20020, 'Error de fragmentación derivada. Sucursal padre no encontrada.');
                        end if;
                    end if;
                end if;
            end if;

        when deleting then
            delete from sucursal_venta_f1 where sucursal_id = :old.sucursal_id;
            delete from sucursal_venta_f2 where sucursal_id = :old.sucursal_id;
            delete from sucursal_venta_f3 where sucursal_id = :old.sucursal_id;
            delete from sucursal_venta_f4 where sucursal_id = :old.sucursal_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors