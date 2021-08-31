SET VERIFY OFF

SET ECHO OFF

SET SERVEROUTPUT ON

ACCEPT cuantos PROMPT 'Cuántos nombre parells vols mostrar:'

ACCEPT a_partir PROMPT 'A partir de quin nombre:'

DECLARE
    var_a_partir  NUMBER := &a_partir;
    minimo        NUMBER := 1;
    maximo        NUMBER := &cuantos;
BEGIN

    WHILE minimo <= maximo LOOP
        IF es_parell(var_a_partir) THEN
            dbms_output.put_line('valor par: ' || var_a_partir);
            minimo := minimo + 1;
        END IF;

        var_a_partir := var_a_partir + 1;
    END LOOP;
END;
