--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Trigger DML para la tabla replicada TIPO_TARJETA_VIDEO

create or replace trigger t_dml_tipo_tarjeta_video
instead of insert or update or delete on tipo_tarjeta_video
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
            insert into tipo_tarjeta_video_r1(tipo_tarjeta_video_id, clave, descripcion) values (:new.tipo_tarjeta_video_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            insert into tipo_tarjeta_video_r2(tipo_tarjeta_video_id, clave, descripcion) values (:new.tipo_tarjeta_video_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            insert into tipo_tarjeta_video_r3(tipo_tarjeta_video_id, clave, descripcion) values (:new.tipo_tarjeta_video_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            insert into tipo_tarjeta_video_r4(tipo_tarjeta_video_id, clave, descripcion) values (:new.tipo_tarjeta_video_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            
            if v_count <> 4 then
                raise_application_error(-20040, 'Número incorrecto de registros insertados en tabla replicada TIPO_TARJETA_VIDEO: ' || v_count);
            end if;

        when deleting then
            v_count := 0;
            delete from tipo_tarjeta_video_r1 where tipo_tarjeta_video_id = :old.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            delete from tipo_tarjeta_video_r2 where tipo_tarjeta_video_id = :old.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            delete from tipo_tarjeta_video_r3 where tipo_tarjeta_video_id = :old.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            delete from tipo_tarjeta_video_r4 where tipo_tarjeta_video_id = :old.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            
            if v_count <> 4 then
                raise_application_error(-20040, 'Número incorrecto de registros eliminados en tabla replicada TIPO_TARJETA_VIDEO: ' || v_count);
            end if;

        when updating then
            v_count := 0;
            update tipo_tarjeta_video_r1 set clave = :new.clave, descripcion = :new.descripcion where tipo_tarjeta_video_id = :new.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            update tipo_tarjeta_video_r2 set clave = :new.clave, descripcion = :new.descripcion where tipo_tarjeta_video_id = :new.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            update tipo_tarjeta_video_r3 set clave = :new.clave, descripcion = :new.descripcion where tipo_tarjeta_video_id = :new.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            update tipo_tarjeta_video_r4 set clave = :new.clave, descripcion = :new.descripcion where tipo_tarjeta_video_id = :new.tipo_tarjeta_video_id;
            v_count := v_count + sql%rowcount;
            
            if v_count <> 4 then
                raise_application_error(-20040, 'Número incorrecto de registros actualizados en tabla replicada TIPO_TARJETA_VIDEO: ' || v_count);
            end if;
    end case;
end;
/
show errors