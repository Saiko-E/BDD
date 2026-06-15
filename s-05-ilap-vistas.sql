--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Creación de vistas que no requieren manejo de BLOBs.

prompt Creando vista SUCURSAL (Fragmentación Horizontal)
create or replace view sucursal as
select sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url from sucursal_f1
union all
select sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url from sucursal_f2
union all
select sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url from sucursal_f3
union all
select sucursal_id, es_venta, es_taller, clave, nombre, latitud, longitud, url from sucursal_f4;

prompt Creando vista SUCURSAL_TALLER (Fragmentación Horizontal)
create or replace view sucursal_taller as
select sucursal_id, tel_atencion, dia_descanso from sucursal_taller_f1
union all
select sucursal_id, tel_atencion, dia_descanso from sucursal_taller_f2
union all
select sucursal_id, tel_atencion, dia_descanso from sucursal_taller_f3
union all
select sucursal_id, tel_atencion, dia_descanso from sucursal_taller_f4;

prompt Creando vista SUCURSAL_VENTA (Fragmentación Horizontal)
create or replace view sucursal_venta as
select sucursal_id, hora_apertura, hora_cierre from sucursal_venta_f1
union all
select sucursal_id, hora_apertura, hora_cierre from sucursal_venta_f2
union all
select sucursal_id, hora_apertura, hora_cierre from sucursal_venta_f3
union all
select sucursal_id, hora_apertura, hora_cierre from sucursal_venta_f4;

prompt Creando vista HISTORICO_STATUS_LAPTOP (Fragmentación Horizontal)
create or replace view historico_status_laptop as
select historico_status_laptop_id, laptop_id, status_laptop_id, fecha_status from historico_status_laptop_f1
union all
select historico_status_laptop_id, laptop_id, status_laptop_id, fecha_status from historico_status_laptop_f2;

prompt Creando vista LAPTOP_INVENTARIO (Fragmentación Vertical)
create or replace view laptop_inventario as
select f2.laptop_id, f2.laptop_reemplazo_id, f2.fecha_status, f2.status_laptop_id, f2.sucursal_id,
       f1.rfc_cliente, f1.num_tarjeta
from laptop_inventario_f1 f1
join laptop_inventario_f2 f2 on f1.laptop_id = f2.laptop_id;

prompt Creando vistas para tablas replicadas (apuntando a r1 local)
create or replace view tipo_almacenamiento as
select tipo_almacenamiento_id, clave, descripcion from tipo_almacenamiento_r1;

create or replace view tipo_monitor as
select tipo_monitor_id, clave, descripcion from tipo_monitor_r1;

create or replace view tipo_procesador as
select tipo_procesador_id, clave, descripcion from tipo_procesador_r1;

create or replace view tipo_tarjeta_video as
select tipo_tarjeta_video_id, clave, descripcion from tipo_tarjeta_video_r1;