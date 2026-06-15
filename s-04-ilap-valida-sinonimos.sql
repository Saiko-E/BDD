--@Autor: Erick Nava Santiago y Arturo Alfaro Dominguez
--@Descripción: Script de validación de sinónimos

Prompt Validando sinónimos para SUCURSAL
select
  (select count(*) from sucursal_f1) as sucursal_f1,
  (select count(*) from sucursal_f2) as sucursal_f2,
  (select count(*) from sucursal_f3) as sucursal_f3,
  (select count(*) from sucursal_f4) as sucursal_f4
from dual;

Prompt Validando sinónimos para SUCURSAL_TALLER
select
  (select count(*) from sucursal_taller_f1) as f1,
  (select count(*) from sucursal_taller_f2) as f2,
  (select count(*) from sucursal_taller_f3) as f3,
  (select count(*) from sucursal_taller_f4) as f4
from dual;

Prompt Validando sinónimos para SUCURSAL_VENTA
select
  (select count(*) from sucursal_venta_f1) as f1,
  (select count(*) from sucursal_venta_f2) as f2,
  (select count(*) from sucursal_venta_f3) as f3,
  (select count(*) from sucursal_venta_f4) as f4
from dual;

Prompt Validando sinónimos para SERVICIO_LAPTOP
select
  (select count(*) from servicio_laptop_f1) as f1,
  (select count(*) from servicio_laptop_f2) as f2,
  (select count(*) from servicio_laptop_f3) as f3,
  (select count(*) from servicio_laptop_f4) as f4
from dual;

Prompt Validando sinónimos para LAPTOP
select
  (select count(*) from laptop_f1) as f1,
  (select count(*) from laptop_f2) as f2,
  (select count(*) from laptop_f3) as f3,
  (select count(*) from laptop_f4) as f4,
  (select count(*) from laptop_f5) as f5
from dual;

Prompt Validando sinónimos para LAPTOP_INVENTARIO
select
  (select count(*) from laptop_inventario_f1) as f1,
  (select count(*) from laptop_inventario_f2) as f2
from dual;

Prompt Validando sinónimos para HISTORICO_STATUS_LAPTOP
select
  (select count(*) from historico_status_laptop_f1) as f1,
  (select count(*) from historico_status_laptop_f2) as f2
from dual;

Prompt Validando sinónimos para tablas replicadas (_R1, _R2, _R3, _R4)
select
  (select count(*) from tipo_monitor_r1) as r1,
  (select count(*) from tipo_monitor_r2) as r2,
  (select count(*) from tipo_monitor_r3) as r3,
  (select count(*) from tipo_monitor_r4) as r4
from dual;