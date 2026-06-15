--@Autor: Erick N
--@Fecha creación: 08/06/2026
--@Descripción: Creación de ligas en los 4 nodos.

clear screen

whenever sqlerror exit rollback;
Prompt ============================
Prompt Creando ligas en ensbdd_s1
Prompt ============================



Prompt Creando ligas en ensbdd_s1



connect ilap_bdd/ilap_bdd@ensbdd_s1
-- PDB local
create database link ensbdd_s2.fi.unam using 'ENSBDD_S2';
--PDB remotas
create database link aadbdd_s1.fi.unam using 'AADBDD_S1';
Create database link aadbdd_s2.fi.unam using 'AADBDD_S2';



Prompt Creando ligas en ensbdd_s2



connect ilap_bdd/ilap_bdd@ensbdd_s2
-- PDB local
create database link ensbdd_s1.fi.unam using 'ENSBDD_S1';
--PDB remotas
create database link aadbdd_s1.fi.unam using 'AADBDD_S1';
Create database link aadbdd_s2.fi.unam using 'AADBDD_S2';



Prompt Creando ligas en aadbdd_s1



connect ilap_bdd/ilap_bdd@aadbdd_s1
-- PDB local
create database link aadbdd_s2.fi.unam using 'AADBDD_S2';
--PDB remotas
create database link ensbdd_s1.fi.unam using 'ENSBDD_S1';
Create database link ensbdd_s2.fi.unam using 'ENSBDD_S2';


Prompt Creando ligas en aadbdd_s2


connect ilap_bdd/ilap_bdd@aadbdd_s2
-- PDB local
create database link aadbdd_s1.fi.unam using 'AADBDD_S1';
--PDB remotas
create database link ensbdd_s1.fi.unam using 'ENSBDD_S1';
Create database link ensbdd_s2.fi.unam using 'ENSBDD_S2';

Prompt Listo!