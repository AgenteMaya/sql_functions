CREATE FUNCTION qtdMaterias(periodo_in char, matricula_in char)
RETURNS integer as
$$
DECLARE
     total integer;
BEGIN
     SELECT count(C.codigo) into total
     FROM cursa C 
     WHERE C.periodo = periodo_in
     AND C.matricula = matricula_in
     GROUP BY  C.matricula;
     return total;
END;
$$
language plpgsql;
