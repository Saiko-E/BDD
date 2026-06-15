--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para fragmentación vertical de LAPTOP_INVENTARIO

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
declare
begin
    case
        when inserting then
            -- Fragmento Oeste (F1)
            insert into laptop_inventario_f1(laptop_id, rfc_cliente, num_tarjeta) 
            values (:new.laptop_id, :new.rfc_cliente, :new.num_tarjeta);
            
            -- Fragmento Norte (F2)
            insert into laptop_inventario_f2(laptop_id, laptop_reemplazo_id, fecha_status, status_laptop_id, sucursal_id) 
            values (:new.laptop_id, :new.laptop_reemplazo_id, :new.fecha_status, :new.status_laptop_id, :new.sucursal_id);

        when deleting then
            delete from laptop_inventario_f1 where laptop_id = :old.laptop_id;
            delete from laptop_inventario_f2 where laptop_id = :old.laptop_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas.');
    end case;
end;
/
show errors