SET VERIFY OFF
SET ECHO OFF
SET SERVEROUTPUT ON 

ACCEPT numero PROMPT 'Introduce una número (sabrás si es par o no):'

DECLARE
    var_num  VARCHAR2(25) := &numero;
   /* es_parell      boolean;*/
BEGIN
    IF es_parell(var_num) THEN
        DBMS_OUTPUT.PUT_LINE('El valor '|| var_num ||' es par.');
        else
        DBMS_OUTPUT.PUT_LINE('El valor '|| var_num ||' no es par.');
      END IF;
END;


create or replace FUNCTION es_parell (valor number)
  RETURN boolean
IS
BEGIN
  IF mod(valor,2)=0 THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;
END es_parell;
