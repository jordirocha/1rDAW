/*create table hr.employees_copy
as select * from employees;
*/
SET VERIFY OFF

SET ECHO OFF

SET SERVEROUTPUT ON

ACCEPT cod_emp PROMPT 'Introduce el codigo del empleado (tus datos serán los mismo:):'

ACCEPT nombre PROMPT 'Nombre del nuevo empleado:'

ACCEPT apellido PROMPT 'Apellido del empleado:'

DECLARE
    var_cod  hr.employees.employee_id%TYPE := &cod_emp;
    var_nom  hr.employees.first_name%TYPE := '&nombre';
    var_ape  hr.employees.last_name%TYPE := '&apellido';
BEGIN
    insert_usuario(var_cod, var_nom, var_ape);
    ultimo_usuario;
END;

CREATE OR REPLACE PROCEDURE insert_usuario (
    cod  hr.employees.employee_id%TYPE,
    nom  hr.employees.first_name%TYPE,
    ape  hr.employees.last_name%TYPE
) AS
    max_id  hr.employees.employee_id%TYPE;
    datos   hr.employees%rowtype;
BEGIN
    SELECT
        MAX(employee_id)
    INTO max_id
    FROM
        hr.employees_copy;

    max_id := max_id + 1;
    dbms_output.put_line('maximo id +1 ' || max_id);
    SELECT
        *
    INTO datos
    FROM
        hr.employees_copy
    WHERE
        employee_id = cod;

    INSERT INTO hr.employees_copy (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    ) VALUES (
        max_id,
        nom,
        ape,
        datos.email,
        datos.phone_number,
        datos.hire_date,
        datos.job_id,
        datos.salary,
        datos.commission_pct,
        datos.manager_id,
        datos.department_id
    );

END insert_usuario;

CREATE OR REPLACE PROCEDURE ultimo_usuario IS
    datos hr.employees%rowtype;
BEGIN
    SELECT
        *
    INTO datos
    FROM
        hr.employees_copy
    WHERE
        employee_id = (
            SELECT
                MAX(employee_id)
            FROM
                employees_copy
        );

    dbms_output.put_line('ID del último empleado: ' || datos.employee_id);
    dbms_output.put_line('Nombre: ' || datos.first_name);
    dbms_output.put_line('Apellido: ' || datos.last_name);
END ultimo_usuario;
