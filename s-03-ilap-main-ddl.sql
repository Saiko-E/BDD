--@Autor: Erick N
--@Fecha creación: 08/06/2026
--@Descripción: Creación de fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;


prompt =====================================
prompt Creando fragmentos para ensbdd_s1 NORTE
prompt =====================================


connect ilap_bdd/ilap_bdd@ensbdd_s1
@s-03-ilap-ens-s1-ddl.sql


prompt =====================================
prompt Creando fragmentos para ensbdd_s2 ESTE
prompt =====================================


connect ilap_bdd/ilap_bdd@ensbdd_s2
@s-03-ilap-ens-s2-ddl.sql



prompt =====================================
prompt Creando fragmentos para aadbdd_s1 OESTE
prompt =====================================



connect ilap_bdd/ilap_bdd@aadbdd_s1
@s-03-ilap-aad-s1-ddl.sql



prompt =====================================
prompt Creando fragmentos para aadbdd_s2 SUR
prompt =====================================


connect ilap_bdd/ilap_bdd@aadbdd_s2
@s-03-ilap-aad-s2-ddl.sql



Prompt Listo!