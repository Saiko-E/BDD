--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Archivo de carga inicial para catálogos replicados manualmente.

clear screen
whenever sqlerror exit rollback;

Prompt Cargando catalogos de forma manual en ensbdd_s1
connect ilap_bdd/ilap_bdd@ensbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Cargando catalogos de forma manual en ensbdd_s2
connect ilap_bdd/ilap_bdd@ensbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Cargando catalogos de forma manual en aadbdd_s1
connect ilap_bdd/ilap_bdd@aadbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Cargando catalogos de forma manual en aadbdd_s2
connect ilap_bdd/ilap_bdd@aadbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Listo!
exit