create or replace type vehiculo as object(
    matricula varchar2(10),
    marca varchar2(50),
    modelo varchar2(50),
    anio number(4),
    
    member function calcularAntiguedad return number
)not final;

create or replace type body Vehiculo as 
    member function CalcularAntiguedad return number is 
    begin 
    return extract(year from sysdate) - anio;
    end;
end;

create or replace type CocheElectrico under vehiculo(
    autonomia number,
    member procedure aumentarAutonomia(autonomia number)
);

create or replace type body CocheElectrico as
    member procedure entarAutonomia(incremento number) is
    begin 
        autonomia := autonomia + incremento;
    end;
end;


create or replace type moto under vehiculo(
    cilindrada number
);

create table CochesElectricos of CocheElectrico;
create table Motos of Moto;

declare 
    cel CochesElectrico;
begin
 cel := CochesElectrico ('ELEC123' , 'Tesla', 'Model S', 2022, 600);
 cel.aumentarAutonomia(100);
 insert into CochesElectricos value(cel);
 dbms_output.put_line('Autonomia actualizada del coche' || cel.matricula || ' es ' || cel.autonomia || ' kms');
end;

declare 
    cel CochesElectrico;
begin
    select * into cel from CochesElectrics where matricula = 'ELEC123';
end;

declare 
    cel CochesElectrico;
begin
    select value(c) into cel from CochesElectrico c where matricula = 'ELEC123';
    dbms_output.put_line('Antiguedad del vehiculo' || cel.calcularAntiguedad || ' anios');
    cel.aumentarAutonomia(900);
    update CochesElectricos cochee set value = cel where cochee.matricula = 'ELEC123';
end;

