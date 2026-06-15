--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Ejecución Main de Triggers para todos los sitios

clear screen
whenever sqlerror exit rollback;

prompt =========================================================
prompt Creando triggers en ensbdd_s1 (Norte)
prompt =========================================================
connect ilap_bdd/ilap_bdd@ensbdd_s1
-- Configurando prompt para mostrar el CON_NAME
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-ens-s1-sucursal-taller-trigger.sql
@s-06-ilap-ens-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-ens-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt =========================================================
prompt Creando triggers en ensbdd_s2 (Este)
prompt =========================================================
connect ilap_bdd/ilap_bdd@ensbdd_s2
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-ens-s2-sucursal-taller-trigger.sql
@s-06-ilap-ens-s2-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-ens-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt =========================================================
prompt Creando triggers en aadbdd_s1 (Oeste)
prompt =========================================================
connect ilap_bdd/ilap_bdd@aadbdd_s1
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-aad-s1-sucursal-taller-trigger.sql
@s-06-ilap-aad-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-aad-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt =========================================================
prompt Creando triggers en aadbdd_s2 (Sur)
prompt =========================================================
connect ilap_bdd/ilap_bdd@aadbdd_s2
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-aad-s2-sucursal-taller-trigger.sql
@s-06-ilap-aad-s2-sucursal-venta-trigger.sql
@s-06-ilap-aad-s2-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-aad-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt Listo! ¡Transparencia DML configurada en todos los nodos!
disconnect