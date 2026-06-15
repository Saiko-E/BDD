--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Vistas con acceso a datos BLOB para el nodo aadbdd_s2 (Sur)

prompt Creando vista LAPTOP (FOTO LOCAL en LAPTOP_F5, no usa funcion)
create or replace view laptop as
select q1.laptop_id, q1.laptop_reemplazo_id, q1.num_serie, 
       q1.cantidad_ram, q1.caracteristicas_extras, q1.tipo_procesador_id, 
       q1.tipo_tarjeta_video_id, q1.tipo_almacenamiento_id, q1.tipo_monitor_id,
       f5.foto
from (
    select laptop_id, laptop_reemplazo_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id from laptop_f1
    union all
    select laptop_id, laptop_reemplazo_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id from laptop_f2
    union all
    select laptop_id, laptop_reemplazo_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id from laptop_f3
    union all
    select laptop_id, laptop_reemplazo_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id from laptop_f4
) q1
join laptop_f5 f5 on q1.laptop_id = f5.laptop_id;

prompt Creando vista SERVICIO_LAPTOP (FACTURA F4 es local)
create or replace view servicio_laptop as
select num_servicio, sucursal_id, laptop_id, diagnostico, importe, get_remote_serv_lap_f1_by_id(num_servicio, sucursal_id) as factura from servicio_laptop_f1
union all
select num_servicio, sucursal_id, laptop_id, diagnostico, importe, get_remote_serv_lap_f2_by_id(num_servicio, sucursal_id) as factura from servicio_laptop_f2
union all
select num_servicio, sucursal_id, laptop_id, diagnostico, importe, get_remote_serv_lap_f3_by_id(num_servicio, sucursal_id) as factura from servicio_laptop_f3
union all
select num_servicio, sucursal_id, laptop_id, diagnostico, importe, factura from servicio_laptop_f4;