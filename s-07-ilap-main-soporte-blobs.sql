--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Script principal empleado para configurar el soporte de datos BLOB en los 4 nodos.

Prompt configurando directorios y otorgando registros.

Prompt configurando soporte BLOB para ensbdd_s1 (Norte)
connect ilap_bdd/ilap_bdd@ensbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt configurando soporte BLOB para ensbdd_s2 (Este)
connect ilap_bdd/ilap_bdd@ensbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt configurando soporte BLOB para aadbdd_s1 (Oeste)
connect ilap_bdd/ilap_bdd@aadbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt configurando soporte BLOB para aadbdd_s2 (Sur)
connect ilap_bdd/ilap_bdd@aadbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt Listo!