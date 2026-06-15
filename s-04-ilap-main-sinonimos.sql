--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Creación de sinónimos main

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Sinónimos para ensbdd_s1 (Norte)
prompt =====================================
connect ilap_bdd/ilap_bdd@ensbdd_s1
-- Configurando prompt para mostrar el CON_NAME
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


@s-04-ilap-ens-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Sinónimos para ensbdd_s2 (Este)
prompt =====================================
connect ilap_bdd/ilap_bdd@ensbdd_s2
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


@s-04-ilap-ens-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Sinónimos para aadbdd_s1 (Oeste)
prompt =====================================
connect ilap_bdd/ilap_bdd@aadbdd_s1
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


@s-04-ilap-aad-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Sinónimos para aadbdd_s2 (Sur)
prompt =====================================
connect ilap_bdd/ilap_bdd@aadbdd_s2
column con_name new_value prompt_con_name
select sys_context('userenv', 'con_name') as con_name from dual;


@s-04-ilap-aad-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt Listo!