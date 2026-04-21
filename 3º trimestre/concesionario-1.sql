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