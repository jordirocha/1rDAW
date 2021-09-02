SET VERIFY OFF

SET ECHO OFF

SET SERVEROUTPUT ON

ACCEPT cod_emp PROMPT 'Introduce el codigo del empleado:'

DECLARE
    datos_emp hr.employees%rowtype;
BEGIN
    SELECT
        *
    INTO datos_emp
    FROM
        employees
    WHERE
        employee_id = &cod_emp;

    IF
        length(datos_emp.first_name) > 5
        AND datos_emp.first_name LIKE 'M%'
    THEN
        dbms_output.put_line('cumple ambas condiciones, nombre mayor a 5 y empieza por M.');
        dbms_output.put_line('el empleado con id: ' || datos_emp.employee_id);
        dbms_output.put_line('el empleado con nombre: ' || datos_emp.first_name);
        dbms_output.put_line('el empleado con last_name: ' || datos_emp.last_name);
    ELSE
        dbms_output.put_line('El empleado con id '
                             || datos_emp.employee_id
                             || ' y nombre '
                             || datos_emp.first_name
                             || ' no contiene M or su nombres menor a 5.');
    END IF;

END;
