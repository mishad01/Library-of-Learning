1.CREATE OR REPLACE VIEW EMPLOYEES_VU AS
SELECT employee_id AS EMPNO, first_name || ' ' || last_name AS EMPLOYEE, department_id AS DEPTNO
FROM employees;
2.SELECT * FROM EMPLOYEES_VU;
3.SELECT view_name, text FROM user_views WHERE view_name = 'EMPLOYEES_VU';
4.SELECT EMPLOYEE, DEPTNO FROM EMPLOYEES_VU;
5.CREATE OR REPLACE VIEW DEPT50 AS
SELECT employee_id AS EMPNO, last_name AS EMPLOYEE, department_id AS DEPTNO
FROM employees
WHERE department_id = 50;
6.DESC DEPT50;
SELECT * FROM DEPT50;
7.-- Attempting to reassign Matos to department 80 through DEPT50 view
UPDATE DEPT50
SET DEPTNO = 80
WHERE EMPLOYEE = 'Matos';

