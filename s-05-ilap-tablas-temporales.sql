--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Creación de tablas temporales para manejo de BLOBs (Fase 2)

prompt Eliminando tablas temporales previas en caso de existir
declare
    cursor cur_tablas is
        select table_name
        from user_tables
        where table_name in ('TI_LAPTOP_F5', 'TS_LAPTOP_F5')
           or table_name like 'TI_SERVICIO_LAPTOP_F_'
           or table_name like 'TS_SERVICIO_LAPTOP_F_';
begin
    for r in cur_tablas loop
        execute immediate 'drop table ' || r.table_name;
    end loop;
end;
/

prompt =========================================================
prompt Tablas temporales para la tabla LAPTOP (Fragmento F5)
prompt =========================================================

-- Tabla para inserciones (DML)
create global temporary table ti_laptop_f5(
    laptop_id number(10,0) constraint ti_laptop_f5_pk primary key,
    foto blob not null
) on commit preserve rows;

-- Tabla para consultas (SELECT)
create global temporary table ts_laptop_f5(
    laptop_id number(10,0) constraint ts_laptop_f5_pk primary key,
    foto blob not null
) on commit preserve rows;

prompt =========================================================
prompt Tablas temporales para SERVICIO_LAPTOP (Fragmentos F1-F4)
prompt =========================================================

-- FRAGMENTO 1 (Norte)
create global temporary table ti_servicio_laptop_f1(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id    number(10, 0) not null,
    diagnostico  varchar2(2000) not null,
    importe      number(8, 2) not null,
    factura      blob,
    constraint ti_servicio_laptop_f1_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f1(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id  number(10, 0) not null,
    factura      blob,
    constraint ts_servicio_laptop_f1_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

-- FRAGMENTO 2 (Este)
create global temporary table ti_servicio_laptop_f2(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id    number(10, 0) not null,
    diagnostico  varchar2(2000) not null,
    importe      number(8, 2) not null,
    factura      blob,
    constraint ti_servicio_laptop_f2_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f2(
    num_servicio number(10, 0)   not null,
    sucursal_id  number(10, 0)   not null,
    laptop_id  number(10, 0)   not null,
    factura      blob,
    constraint ts_servicio_laptop_f2_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

-- FRAGMENTO 3 (Oeste)
create global temporary table ti_servicio_laptop_f3(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id    number(10, 0) not null,
    diagnostico  varchar2(2000) not null,
    importe      number(8, 2) not null,
    factura      blob,
    constraint ti_servicio_laptop_f3_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f3(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id  number(10, 0) not null,
    factura      blob,
    constraint ts_servicio_laptop_f3_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

-- FRAGMENTO 4 (Sur)
create global temporary table ti_servicio_laptop_f4(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id    number(10, 0) not null,
    diagnostico  varchar2(2000) not null,
    importe      number(8, 2) not null,
    factura      blob,
    constraint ti_servicio_laptop_f4_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f4(
    num_servicio number(10, 0) not null,
    sucursal_id  number(10, 0) not null,
    laptop_id  number(10, 0) not null,
    factura      blob,
    constraint ts_servicio_laptop_f4_pk PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
) on commit preserve rows;