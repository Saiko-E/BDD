--connect sys/system1 as sysdba;
--create pluggable database aadbdd_s1
--admin user admin identified by admin
--file_name_convert = (
--'/opt/oracle/oradata/FREE/pdbseed',
--'/opt/oracle/oradata/FREE/aadbdd_s1'
--);
----crea aadbdd_s2
--create pluggable database aadbdd_s2
--admin user admin identified by admin
--file_name_convert = (
--'/opt/oracle/oradata/FREE/pdbseed',
--'/opt/oracle/oradata/FREE/aadbdd_s2'
--);


--para aadbdd_s1
connect sys/system1@aadbdd_s1 as sysdba
create tablespace users
datafile '/opt/oracle/oradata/FREE/aadbdd_s1/users01.dbf' size 100m
autoextend on next 10m maxsize 11g
extent management local
segment space management auto;
--asignar al tablespace users como el tablespace por defecto
alter database default tablespace users;
--para aadbdd_s2
connect sys/system1@aadbdd_s2 as sysdba
create tablespace users
datafile '/opt/oracle/oradata/FREE/aadbdd_s2/users01.dbf' size 100m
autoextend on next 10m maxsize 11g
extent management local
segment space management auto;
--asignar al tablespace users como el tablespace por defecto
alter database default tablespace users;