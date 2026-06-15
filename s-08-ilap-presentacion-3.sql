--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Archivo de carga inicial en vistas globales

clear screen
set serveroutput on

Prompt ======================================
Prompt Preparando carga de Datos
Prompt ======================================
Prompt =>Seleccionar la PDB para insertar datos
Prompt =>Asegurarse que las imágenes existen en ambos servidores
Prompt =>Ejecutar s-08-ilap-presentacion-3.sh en ambos antes de continuar

connect ilap_bdd/ilap_bdd@&pdb
Prompt Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
Prompt =>Al ocurrir un error se saldrá del programa y se hará rollback
whenever sqlerror exit rollback

Pause => Presionar Enter para iniciar con la extraccion de datos binarios, Ctrl-C para cancelar
!sh s-08-ilap-presentacion-3.sh

Prompt ======================================
Prompt ¿Listo para iniciar con la carga?
Prompt ======================================
Pause => Presionar Enter para iniciar, Ctrl-C para cancelar

Prompt => Realizando limpieza inicial ....
set feedback off

Prompt Eliminando datos (Orden de dependencias)
delete from servicio_laptop;
delete from historico_status_laptop;
delete from laptop_inventario;
delete from laptop;
delete from sucursal_venta;
delete from sucursal_taller;
delete from sucursal;
delete from tipo_tarjeta_video;
delete from tipo_procesador;
delete from tipo_monitor;
delete from tipo_almacenamiento;
delete from ti_servicio_laptop_f1;
delete from ti_servicio_laptop_f2;
delete from ti_servicio_laptop_f3;
delete from ti_servicio_laptop_f4;
delete from ti_laptop_f5;
Prompt => Realizando Carga de datos
Prompt cargando tipo_tarjeta_video
@carga-inicial/tipo_tarjeta_video.sql
Prompt cargando tipo_procesador
@carga-inicial/tipo_procesador.sql
Prompt cargando tipo_monitor
@carga-inicial/tipo_monitor.sql
Prompt cargando tipo_almacenamiento
@carga-inicial/tipo_almacenamiento.sql

Prompt cargando sucursal
@carga-inicial/sucursal-1.sql
@carga-inicial/sucursal-2.sql
@carga-inicial/sucursal-3.sql

Prompt cargando sucursal_taller
@carga-inicial/sucursal_taller-1.sql
@carga-inicial/sucursal_taller-2.sql

Prompt cargando sucursal_venta
@carga-inicial/sucursal_venta-1.sql
@carga-inicial/sucursal_venta-2.sql

Prompt cargando laptop (con datos BLOB)
@carga-inicial/laptop-1-empty-blob.sql
@carga-inicial/laptop-2-empty-blob.sql

Prompt cargando laptop_inventario
@carga-inicial/laptop_inventario.sql

Prompt cargando historico_status_laptop
@carga-inicial/historico_status_laptop-1.sql
@carga-inicial/historico_status_laptop-2.sql

Prompt cargando servicio_laptop (con datos BLOB)
@carga-inicial/servicio_laptop-1-empty-blob.sql
@carga-inicial/servicio_laptop-2-empty-blob.sql

Prompt Carga de datos completa. Haciendo commit!
