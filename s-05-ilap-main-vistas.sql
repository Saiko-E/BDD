--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Creación de vistas para todos los sitios (Main)

clear screen
whenever sqlerror exit rollback;

prompt =========================================================
prompt Creando vistas para ensbdd_s1 (Norte)
prompt =========================================================
connect ilap_bdd/ilap_bdd@ensbdd_s1
-- Configurando prompt para mostrar el CON_NAME
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


prompt Creando vistas que no requieren manejo de BLOBS
@s-05-ilap-vistas.sql
prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando objetos para manejo de BLOBS
@s-05-ilap-funciones-blob.sql
prompt Creando vistas con soporte para BLOBS (Específico Norte)
@s-05-ilap-ens-s1-vistas-blob.sql

prompt =========================================================
prompt Creando vistas para ensbdd_s2 (Este)
prompt =========================================================
connect ilap_bdd/ilap_bdd@ensbdd_s2
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


prompt Creando vistas que no requieren manejo de BLOBS
@s-05-ilap-vistas.sql
prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando objetos para manejo de BLOBS
@s-05-ilap-funciones-blob.sql
prompt Creando vistas con soporte para BLOBS (Específico Este)
@s-05-ilap-ens-s2-vistas-blob.sql

prompt =========================================================
prompt Creando vistas para aadbdd_s1 (Oeste)
prompt =========================================================
connect ilap_bdd/ilap_bdd@aadbdd_s1
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


prompt Creando vistas que no requieren manejo de BLOBS
@s-05-ilap-vistas.sql
prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando objetos para manejo de BLOBS
@s-05-ilap-funciones-blob.sql
prompt Creando vistas con soporte para BLOBS (Específico Oeste)
@s-05-ilap-aad-s1-vistas-blob.sql

prompt =========================================================
prompt Creando vistas para aadbdd_s2 (Sur)
prompt =========================================================
connect ilap_bdd/ilap_bdd@aadbdd_s2
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


prompt Creando vistas que no requieren manejo de BLOBS
@s-05-ilap-vistas.sql
prompt Creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando objetos para manejo de BLOBS
@s-05-ilap-funciones-blob.sql
prompt Creando vistas con soporte para BLOBS (Específico Sur)
@s-05-ilap-aad-s2-vistas-blob.sql

prompt Listo!
disconnect