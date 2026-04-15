DROP DATABASE IF EXISTS banco_pc114;
CREATE DATABASE banco_pc114;
USE banco_pc114;

CREATE TABLE cuentas (
id_cuenta INT PRIMARY KEY,
titular VARCHAR(100) NOT NULL,
saldo DECIMAL(10,2) NOT NULL
) ;

CREATE TABLE movimientos (
id_mov INT AUTO_INCREMENT PRIMARY KEY,
id_cuenta INT NOT NULL,
tipo VARCHAR(30) NOT NULL,
importe DECIMAL(10,2) NOT NULL,
fecha_mov TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
) ;

INSERT INTO cuentas (id_cuenta, titular, saldo) VALUES
(1, 'PC114', 1000.00),
(2, 'Daniel ', 1000.00),
(3, 'Carlos', 1500.00);

SELECT * FROM cuentas;

-- Simula una transferencia de 200 € desde la cuenta de PC114 a la cuenta de Daniel y confirma la operación.

start transaction;

-- Resta 200 € a la cuenta 1
update cuentas set saldo = saldo - 200 where id_cuenta = 1;
-- Suma 200 € a la cuenta 2.
update cuentas set saldo = saldo + 200 where id_cuenta = 2;

-- Inserta dos movimientos
INSERT INTO movimientos (id_cuenta, tipo, importe) VALUES (1, 'transferencia_salida', 200.00);
INSERT INTO movimientos (id_cuenta, tipo, importe) VALUES (2, 'transferencia_entrada', 200.00);

commit;
select * from cuentas;
select * from movimientos;	


-- transferencia de 300 € desde la cuenta 1 a la cuenta 2

start transaction;

update cuentas set saldo = saldo - 300 where id_cuenta = 1;
update cuentas set saldo = saldo + 300 where id_cuenta = 2;

insert into movimientos (id_cuenta, tipo, importe) values (1, 'transferencia_salida', 200.00);
insert into movimientos (id_cuenta, tipo, importe) values (2, 'transferencia_entrada', 200.00);

savepoint movimiento1; 

--  cobro de una comisión de 20 € a la cuenta 1

update cuentas set saldo = saldo - 20 where id_cuenta = 1;
insert into movimientos (id_cuenta, tipo, importe) values (1, 'transferencia_salida', 20.00);


rollback to savepoint movimiento1;

select * from cuentas;
select * from movimientos;
commit;

-- bloquear una transacción de la cuenta 1

start transaction;

select * from cuentas where id_cuenta = 1 for update;

commit;