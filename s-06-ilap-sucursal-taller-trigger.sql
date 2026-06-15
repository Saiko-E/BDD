--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para fragmentación horizontal derivada (SUCURSAL_TALLER)

create or replace trigger t_dml_sucursal_taller
instead of insert or update or delete on sucursal_taller
declare
    v_count number;
begin
    case
        when inserting then
            select count(*) into v_count from sucursal_f1 where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into sucursal_taller_f1(sucursal_id, telefono_atencion, dia_descanso) values (:new.sucursal_id, :new.telefono_atencion, :new.dia_descanso);
            else
                select count(*) into v_count from sucursal_f2 where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    insert into sucursal_taller_f2(sucursal_id, telefono_atencion, dia_descanso) values (:new.sucursal_id, :new.telefono_atencion, :new.dia_descanso);
                else
                    select count(*) into v_count from sucursal_f3 where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        insert into sucursal_taller_f3(sucursal_id, telefono_atencion, dia_descanso) values (:new.sucursal_id, :new.telefono_atencion, :new.dia_descanso);
                    else
                        select count(*) into v_count from sucursal_f4 where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            insert into sucursal_taller_f4(sucursal_id, telefono_atencion, dia_descanso) values (:new.sucursal_id, :new.telefono_atencion, :new.dia_descanso);
                        else
                            raise_application_error(-20020, 'El registro que se intenta insertar no cumple con el esquema de fragmentación horizontal derivada. Padre no encontrado.');
                        end if;
                    end if;
                end if;
            end if;

        when deleting then
            delete from sucursal_taller_f1 where sucursal_id = :old.sucursal_id;
            delete from sucursal_taller_f2 where sucursal_id = :old.sucursal_id;
            delete from sucursal_taller_f3 where sucursal_id = :old.sucursal_id;
            delete from sucursal_taller_f4 where sucursal_id = :old.sucursal_id;

        when updating then
            raise_application_error(-20030, 'Operaciones UPDATE no soportadas en tablas con esquema de fragmentación.');
    end case;
end;
/
show errors