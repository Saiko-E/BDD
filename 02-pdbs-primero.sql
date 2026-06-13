connect sys/system1 as sysdba;
create pluggable database ensbdd_s1
admin user admin identified by admin
file_name_convert = (
'/opt/oracle/oradata/FREE/pdbseed',
'/opt/oracle/oradata/FREE/ensbdd_s1'
);
--crea ensbdd_s2
create pluggable database ensbdd_s2
admin user admin identified by admin
file_name_convert = (
'/opt/oracle/oradata/FREE/pdbseed',
'/opt/oracle/oradata/FREE/ensbdd_s2'
);


--para ensbdd_s1
connect sys/system1@ensbdd_s1 as sysdba
create tablespace users
datafile '/opt/oracle/oradata/FREE/ensbdd_s1/users01.dbf' size 100m
autoextend on next 10m maxsize 11g
extent management local
segment space management auto;
--asignar al tablespace users como el tablespace por defecto
alter database default tablespace users;
--para ensbdd_s2
connect sys/system1@ensbdd_s2 as sysdba
create tablespace users
datafile '/opt/oracle/oradata/FREE/ensbdd_s2/users01.dbf' size 100m
autoextend on next 10m maxsize 11g
extent management local
segment space management auto;
--asignar al tablespace users como el tablespace por defecto
alter database default tablespace users;