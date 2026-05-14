/*Bloque anonimo*/
-- 1
declare 
    v_id marcas_coche.id_marca%type := &id_marca1;
    v_marca marcas_coche.marca%type;
begin
    select marca into v_marca from marcas_coche
    where id_marca = v_id;
    dbms_output.put_line('La marca con id' || v_id || ' es ' || v_marca);
end;

-- 2
declare 
    v_dni cliente.dni%type := &dnil;
    v_nombre cliente.nombre%type;
    v_telefono cliente.telef%type;
begin
    select nombre, telef into v_nombre, v_telefono from cliente
    where dni = v_dni; 
    dbms_output.put_line('Datos cliente: ' || v_nombre || ' - ' || v_telefono);
end;

-- 3
declare 
    v_dni cliente.dni%type := &dnil;
    v_nombre cliente.nombre%type;
    v_telefono cliente.telef%type;
begin
    select nombre, telef into v_nombre, v_telefono from cliente
    where dni = v_dni; 
    dbms_output.put_line('Datos cliente: ' || v_nombre || ' - ' || v_telefono);
    
    exception 
    when no_data_found then
        dbms_output.put_line('No hay datos: ' || sqlerm);
end;

-- 4
declare 
    v_matricula coche.matricula%type := &matricula1;
    v_id_modelo coche.id_modelo%type;
    v_precio_compra coche.precio_compra%type;
begin
    select matricula, id_modelo, precio_compra into v_matricula, v_id_modelo, v_precio_compra 
    from coche where matricula = v_matricula;
    
    dbms_output.put_line('Datos del coche: ' || v_matricula || ' - ' || v_id_modelo || ' - ' || v_precio_compra);

end;


-- 6 
declare 
    v_id_modelo modelo_coche.id_modelo%type := &modelocoche;
    v_modelo modelo_coche%rowtype;    
    v_marca marcas_coche.marca%type;
    
begin
    select m.id_modelo, m.descripcion, ma.marca 
    into v_modelo.id_modelo, v_modelo.descripcion, v_marca
    from modelo_coche m join marcas_coche ma
    on (m.id_marca = ma.id_marca)
    where v_id_modelo = id_modelo;
    dbms_output.put_line('Modelo ID: ' || v_modelo || chr(10) ||
                         'Descripción' || v_modelo.descripcion || chr(10) ||
                         'Marca' || v_marca || chr(10));

end;




/*PROCEDIMIENTOS*/
-- 1
create or replace procedure contar_modelo_coche(v_marca marcas_coche.marca%type) as 
    v_cantidad number;
begin
    select count(*) into v_cantidad
    from modelo_coche mc join marcas_coche ma
    on mc.id_marca = ma.id_marca
    where ma.marca = v_marca;
    dbms_output.put_line('La cantidad de coches de ' || v_marca || ' es ' || v_cantidad);
end;

declare    
    v_marca marcas_coche.marca%type := 'Citroen';
begin 
    contar_modelo_coche(v_marca);
end;

-- 2
create or replace procedure nombre_poco_original_n1 (v_matricula vende.matricula%type) as 
    v_nombre_cliente cliente.nombre%type;
    v_nombre_empleado empleado.nombre%type;
    v_precio vende.precio%type;
    
begin
    select c.nombre, e.nombre, v.precio 
    into v_nombre_cliente, v_nombre_empleado,v_precio
    from cliente c join vende v
    on (v.dni_cliente = c.dni) join empleado e
    on (v.dni_empleado = e.dni)
    where v_matricula = v.matricula;
    dbms_output.put_line('Matricula: ' || v_matricula || chr(10) ||
                         'Nombre cliente: ' || v_nombre_cliente || chr(10) ||
                         'Nombre empleado: ' || v_nombre_empleado || chr(10) ||
                         'Precio de venta: ' || v_precio || chr(10) );
exception
    when no_data_found then dbms_output.put_line('No hay datos');
    
end;

begin 
    nombre_poco_original_n1('&matricula');
end;

-- 3
create or replace procedure alguien (v_cant vende.dni_cliente%type) as
    v_cant vende.dni_cliente%type;
begin
    select count(*) into v_cant from vende
    where dni_empleado = v_cant;
    
    if v_cant = 0 then 
    dbms_output.put_line('El empleado tiene ventas');
    else if v_cant > 0 then 
    dbms_output.put_line('El empleado no tiene ventas');
    end if;
    end if;
end;

begin 
    alguien('ADWAW');
end;


/*FUNCIONES*/
-- 1
create or replace function algo(v_dni_empleado vende.dni_empleado%type) return number 
as v_cantidad number;

begin 
select count(matricula) into v_cantidad
from vende 
where dni_empleado = matricula;
return v_sumaprecio;

end;

-- 2
create or replace function precio_venta(v_dni vende.dni_empleado%type) return number 
as v_sumaprecio vende.precio%type := 0;

begin 
select sum(precio) into v_sumaprecio
from vende 
where v_dni = dni_empleado;

return v_sumaprecio;
end;

/*DISPARADORES*/
-- 1
create or replace NONEDITIONABLE trigger check_precio_compra
before insert on coche
for each row 

begin
    if :new.precio_compra is null or :new.precio_compra <= 0 then 
    raise_application_error(-20001, 'El precio_compra no es correcto');
    end if;
end;

insert into coche (matricula, id_modelo, precio_compra) values ('1234AA',1,0);

-- 2 
alter table coche add (fecha_insercion date);

create or replace trigger fecha
before insert on coche
for each row 

begin
    :new.fecha_insercion := sysdate;
    
end;

insert into coche (matricula, id_modelo, precio_compra) values ('1234AA',1,0);

-- 3
create or replace trigger la_ley_del_capitalismo
before update of precio_compra on coche
for each row 

begin
    if :new.precio_compra < :old.precio_compra then 
    raise_application_error(-20002, 'El precio_compra no es lo suficientemente alto');
    end if;
end;

insert into coche (matricula, id_modelo, precio_compra) values ('1234AA',1,0);

-- 4
CREATE OR REPLACE TRIGGER trg_update_precio_con_iva
BEFORE UPDATE ON coche
FOR EACH ROW
BEGIN
    -- Comprobar si el precio_compra ha cambiado
    IF :OLD.precio_compra != :NEW.precio_compra THEN
        -- Aplicar el 21% de IVA al nuevo precio
        :NEW.precio_compra := :NEW.precio_compra * 1.21;
    END IF;
END;
/
