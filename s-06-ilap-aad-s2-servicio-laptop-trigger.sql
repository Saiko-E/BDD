--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para SERVICIO_LAPTOP (Nodo Sur - aadbdd_s2)

create or replace trigger t_dml_servicio_laptop
instead of insert or update or delete on servicio_laptop
declare
    v_count number;
begin
    case
        when inserting then
            -- 1. LOCAL: Intenta en el Sur (F4)
            select count(*) into v_count from sucursal_f4 where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into servicio_laptop_f4(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura)
                values (:new.num_servicio, :new.sucursal_id, :new.laptop_id, :new.diagnostico, :new.importe, :new.factura);
            else
                -- 2. REMOTO: Intenta en el Norte (F1)
                select count(*) into v_count from sucursal_f1 where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    insert into ti_servicio_laptop_f1(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura) values (:new.num_servicio, :new.sucursal_id, :new.laptop_id, :new.diagnostico, :new.importe, :new.factura);
                    insert into servicio_laptop_f1(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura) select num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura from ti_servicio_laptop_f1 where num_servicio = :new.num_servicio and sucursal_id = :new.sucursal_id;
                    delete from ti_servicio_laptop_f1 where num_servicio = :new.num_servicio and sucursal_id = :new.sucursal_id;
                else
                    -- 3. REMOTO: Intenta en el Este (F2)
                    select count(*) into v_count from sucursal_f2 where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        insert into ti_servicio_laptop_f2(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura) values (:new.num_servicio, :new.sucursal_id, :new.laptop_id, :new.diagnostico, :new.importe, :new.factura);
                        insert into servicio_laptop_f2(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura) select num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura from ti_servicio_laptop_f2 where num_servicio = :new.num_servicio and sucursal_id = :new.sucursal_id;
                        delete from ti_servicio_laptop_f2 where num_servicio = :new.num_servicio and sucursal_id = :new.sucursal_id;
                    else
                        -- 4. REMOTO: Intenta en el Oeste (F3)
                        select count(*) into v_count from sucursal_f3 where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            insert into ti_servicio_laptop_f3(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura) values (:new.num_servicio, :new.sucursal_id, :new.laptop_id, :new.diagnostico, :new.importe, :new.factura);
                            insert into servicio_laptop_f3(num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura) select num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura from ti_servicio_laptop_f3 where num_servicio = :new.num_servicio and sucursal_id = :new.sucursal_id;
                            delete from ti_servicio_laptop_f3 where num_servicio = :new.num_servicio and sucursal_id = :new.sucursal_id;
                        else
                            raise_application_error(-20020, 'Error de fragmentación derivada. Sucursal padre no encontrada.');
                        end if;
                    end if;
                end if;
            end if;

        when deleting then
            delete from servicio_laptop_f1 where num_servicio = :old.num_servicio and sucursal_id = :old.sucursal_id;
            delete from servicio_laptop_f2 where num_servicio = :old.num_servicio and sucursal_id = :old.sucursal_id;
            delete from servicio_laptop_f3 where num_servicio = :old.num_servicio and sucursal_id = :old.sucursal_id;
            delete from servicio_laptop_f4 where num_servicio = :old.num_servicio and sucursal_id = :old.sucursal_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors