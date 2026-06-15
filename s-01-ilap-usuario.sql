--@Autor: Erick N
--@Fecha creación: 08/06/2026
--@Descripción: Eliminación y creación del usuario.

Prompt Creando al usuario ilap_bdd
drop user if exists ilap_bdd cascade;
create user ilap_bdd identified by ilap_bdd quota unlimited on users;

grant create session, 
      create table, 
      create sequence, 
      create procedure, 
      create view,
      create synonym, 
      create database link,
      create any directory,
      create trigger
to ilap_bdd;
--Completar

