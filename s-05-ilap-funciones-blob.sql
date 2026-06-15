--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Definición de funciones autónomas para extracción de BLOBs remotos

prompt =========================================================
prompt Función para extraer FOTO de LAPTOP_F5 (Sur)
prompt =========================================================

create or replace function get_remote_foto_f5_by_id(p_laptop_id in number)
return blob is
    pragma autonomous_transaction;
    v_temp_blob blob;
begin
    -- Asegura que no haya registros basura
    delete from ts_laptop_f5;
    
    -- Inserta el dato obtenido del fragmento remoto usando el sinónimo
    insert into ts_laptop_f5 (laptop_id, foto)
    select laptop_id, foto
    from laptop_f5
    where laptop_id = p_laptop_id;
    
    -- Extrae a la variable local
    select foto into v_temp_blob
    from ts_laptop_f5
    where laptop_id = p_laptop_id;
    
    -- Limpia y cierra transacción
    delete from ts_laptop_f5;
    commit;
    
    return v_temp_blob;
exception
    when others then
        rollback;
        raise;
end;
/
show errors

prompt =========================================================
prompt Funciones para extraer FACTURA de SERVICIO_LAPTOP
prompt =========================================================

-- FUNCIÓN FRAGMENTO 1 (Norte)
create or replace function get_remote_serv_lap_f1_by_id(
    p_num_servicio in number, p_sucursal_id in number, p_laptop_id in number
) return blob is
    pragma autonomous_transaction;
    v_temp_blob blob;
begin
    delete from ts_servicio_laptop_f1;
    
    insert into ts_servicio_laptop_f1(num_servicio, sucursal_id,laptop_id, factura)
    select num_servicio, sucursal_id, laptop_id, factura
    from servicio_laptop_f1
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    select factura into v_temp_blob
    from ts_servicio_laptop_f1
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    delete from ts_servicio_laptop_f1;
    commit;
    return v_temp_blob;
exception
    when others then
        rollback;
        raise;
end;
/
show errors

-- FUNCIÓN FRAGMENTO 2 (Este)
create or replace function get_remote_serv_lap_f2_by_id(
    p_num_servicio in number, p_sucursal_id in number, p_laptop_id in number
) return blob is
    pragma autonomous_transaction;
    v_temp_blob blob;
begin
    delete from ts_servicio_laptop_f2;
    
    insert into ts_servicio_laptop_f2(num_servicio, sucursal_id, laptop_id, factura)
    select num_servicio, sucursal_id,laptop_id, factura
    from servicio_laptop_f2
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    select factura into v_temp_blob
    from ts_servicio_laptop_f2
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    delete from ts_servicio_laptop_f2;
    commit;
    return v_temp_blob;
exception
    when others then
        rollback;
        raise;
end;
/
show errors

-- FUNCIÓN FRAGMENTO 3 (Oeste)
create or replace function get_remote_serv_lap_f3_by_id(
    p_num_servicio in number, p_sucursal_id in number, p_laptop_id in number
) return blob is
    pragma autonomous_transaction;
    v_temp_blob blob;
begin
    delete from ts_servicio_laptop_f3;
    
    insert into ts_servicio_laptop_f3(num_servicio, sucursal_id,laptop_id, factura)
    select num_servicio, sucursal_id,laptop_id, factura
    from servicio_laptop_f3
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    select factura into v_temp_blob
    from ts_servicio_laptop_f3
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    delete from ts_servicio_laptop_f3;
    commit;
    return v_temp_blob;
exception
    when others then
        rollback;
        raise;
end;
/
show errors

-- FUNCIÓN FRAGMENTO 4 (Sur)
create or replace function get_remote_serv_lap_f4_by_id(
    p_num_servicio in number, p_sucursal_id in number, p_laptop_id in number
) return blob is
    pragma autonomous_transaction;
    v_temp_blob blob;
begin
    delete from ts_servicio_laptop_f4;
    
    insert into ts_servicio_laptop_f4(num_servicio, sucursal_id,laptop_id, factura)
    select num_servicio, sucursal_id, laptop_id,factura
    from servicio_laptop_f4
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    select factura into v_temp_blob
    from ts_servicio_laptop_f4
    where num_servicio = p_num_servicio
      and laptop_id = p_laptop_id;
      
    delete from ts_servicio_laptop_f4;
    commit;
    return v_temp_blob;
exception
    when others then
        rollback;
        raise;
end;
/
show errors