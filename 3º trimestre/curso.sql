/* 1.- Mostrar 'Hola mundo por pantalla'  */
declare
begin
    dbms_output.put_line('Hola Mundo');
end;

/* 2.- Ejemplo 2 */
declare
    numero number := 5;
begin
    numero := numero * 2;
    dbms_output.put_line('El resultado es: ' || numero);
end;

/* 3.- Declara una variable numerica y mostrar si es mayor o menor que 10*/

declare 
    numero number := 1;
begin 
    if (numero < 10) then
        dbms_output.put_line('El resultado es menor que 10 ');
    elsif (numero > 10) then
        dbms_output.put_line('El resultado es mayor que 10 ');
    else
        dbms_output.put_line('El resultado es mayor que 10 ');
    end if;

end;

/* 4.- Mostrar los números del 1 al 10 con while*/

declare 
    numero number := 1;
begin

    while (numero < 11) loop
    dbms_output.put_line(numero);
    numero := numero + 1;
    end loop;

end;

/*5. Mostrar los números del 1 al 10 con for*/
begin

    for algo in 1..10 loop
    dbms_output.put_line(algo);
    end loop;

end;

/*6. Declarar variable númerica nota y mostrar con case si aprobado o no */
declare
    varnota varchar(30);
begin
    case numero
    when numero > 5 then set (varnota = 'aprobado')
end;

/*7. Excepción ZERO_DIVISE */

/*8. Excepción personalizada con RAISE */
