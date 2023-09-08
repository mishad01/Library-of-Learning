1.
select e.last_name, department_id , d.department_name from employees e JOIN departments d USING (department_id);

SELECT e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

desc location;
select * from employees;
select * from departments;
select * locations;
2.
select DISTINCT e.job_id,d.location_id from employees e JOIN departments d on (e.department_id = d.department_id) where e.department_id = 30 or e.department_id = 90;

3.
select e.last_name,d.department_name,l.location_id,l.city  from employees e JOIN departments d on (e.department_id = d.department_id) JOIN locations l on (d.location_id = l.location_id) where e.COMMISSION_PCT is not null order by e.last_name; 
4.
select e.last_name,d.department_name from employees e JOIN  departments d using (department_id) where e.last_name like '%a%';
5.
select e.last_name, e.job_id, d.department_id, d.department_name FROM employees e
JOIN departments d ON d.department_id = e.department_id JOIN locations l on d.location_id = l.location_id where l.city = 'Toronto';

6. SELECT
    e1.last_name AS Employee,
    e1.employee_id AS "Emp#",
    e2.last_name AS Manager,
    e2.employee_id AS "Mgr#"
FROM
    employees e1
JOIN
    employees e2 ON e1.manager_id = e2.employee_id;

7. SELECT
    e1.last_name AS Employee,
    e1.employee_id AS "Emp#",
    e2.last_name AS Manager,
    e2.employee_id AS "Mgr#"
FROM
    employees e1
LEFT JOIN
    employees e2 ON e1.manager_id = e2.employee_id
ORDER BY
    "Emp#";

