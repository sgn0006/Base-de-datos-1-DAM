USE banco_pc114;

start transaction;
update cuentas set saldo = 0 where id_cuenta = 1;

SELECT * FROM cuentas;
SELECT * FROM movimientos;

commit;