s-04-ilap-aad-s1-sinonimos.sql--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Creación de sinónimos para el nodo aadbdd_s1 (Oeste)

-- SUCURSAL
create or replace synonym sucursal_f1 for sucursal_f1_ens_s1@ensbdd_s1;
create or replace synonym sucursal_f2 for sucursal_f2_ens_s2@ensbdd_s2;
create or replace synonym sucursal_f3 for sucursal_f3_aad_s1;
create or replace synonym sucursal_f4 for sucursal_f4_aad_s2@aadbdd_s2;

-- SUCURSAL_TALLER
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_ens_s1@ensbdd_s1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_ens_s2@ensbdd_s2;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_aad_s1;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_aad_s2@aadbdd_s2;

-- SUCURSAL_VENTA
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_ens_s1@ensbdd_s1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_ens_s2@ensbdd_s2;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_aad_s1;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_aad_s2@aadbdd_s2;

-- SERVICIO_LAPTOP
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_ens_s1@ensbdd_s1;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_ens_s2@ensbdd_s2;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_aad_s1;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_aad_s2@aadbdd_s2;

-- LAPTOP
create or replace synonym laptop_f1 for laptop_f1_ens_s1@ensbdd_s1;
create or replace synonym laptop_f2 for laptop_f2_aad_s2@aadbdd_s2;
create or replace synonym laptop_f3 for laptop_f3_aad_s1;
create or replace synonym laptop_f4 for laptop_f4_ens_s2@ensbdd_s2;
create or replace synonym laptop_f5 for laptop_f5_aad_s2@aadbdd_s2;

-- LAPTOP_INVENTARIO
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_aad_s1;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_ens_s1@ensbdd_s1;

-- HISTORICO_STATUS_LAPTOP
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_ens_s2@ensbdd_s2;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_ens_s1@ensbdd_s1;

-- TABLAS REPLICADAS (Catálogos)
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r@ensbdd_s1;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r@ensbdd_s2;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r@aadbdd_s2;

create or replace synonym tipo_monitor_r1 for tipo_monitor_r;
create or replace synonym tipo_monitor_r2 for tipo_monitor_r@ensbdd_s1;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r@ensbdd_s2;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r@aadbdd_s2;

create or replace synonym tipo_procesador_r1 for tipo_procesador_r;
create or replace synonym tipo_procesador_r2 for tipo_procesador_r@ensbdd_s1;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r@ensbdd_s2;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r@aadbdd_s2;

create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r@ensbdd_s1;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r@ensbdd_s2;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r@aadbdd_s2;