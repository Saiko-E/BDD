--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para fragmentación horizontal de HISTORICO_STATUS_LAPTOP

create or replace trigger t_dml_historico_status_laptop
instead of insert or update or delete on historico_status_laptop
declare
begin
    case
        when inserting then
            -- Regla: Registros hasta 2009 van al fragmento 1 (Este), posteriores al fragmento 2 (Norte)
            if extract(year from :new.fecha_status) <= 2009 then
                insert into historico_status_laptop_f1(historico_status_laptop_id, laptop_id, status_laptop_id, fecha_status) 
                values (:new.historico_status_laptop_id, :new.laptop_id, :new.status_laptop_id, :new.fecha_status);
            else
                insert into historico_status_laptop_f2(historico_status_laptop_id, laptop_id, status_laptop_id, fecha_status) 
                values (:new.historico_status_laptop_id, :new.laptop_id, :new.status_laptop_id, :new.fecha_status);
            end if;

        when deleting then
            delete from historico_status_laptop_f1 where historico_status_laptop_id = :old.historico_status_laptop_id;
            delete from historico_status_laptop_f2 where historico_status_laptop_id = :old.historico_status_laptop_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors