SET VERIFY OFF
SET ECHO OFF
SET SERVEROUTPUT ON 

ACCEPT nombre PROMPT 'Introduce una palabra:'

DECLARE
    var_palabra  VARCHAR2(25) := '&nombre';
    vocales      NUMBER(10);
BEGIN
    vocales := contar_vocal(var_palabra);
    dbms_output.put_line('La palabra &nombre tiene: ' || vocales || ' vocales.');
END;

CREATE OR REPLACE FUNCTION contar_vocal (
    palabra VARCHAR2
) RETURN NUMBER AS
    cantidad_vocales NUMBER;
BEGIN
    SELECT
        regexp_count(palabra, '[a|e|i|o|u]')
    INTO cantidad_vocales
    FROM
        dual;
return cantidad_vocales;
END contar_vocal;
