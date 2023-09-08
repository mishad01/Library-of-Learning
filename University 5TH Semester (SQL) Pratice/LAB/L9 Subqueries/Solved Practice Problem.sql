1.
SELECT last_name,hire_date from employees where department_id IN (select department_id from employees where last_name ='Zlotkey') AND last_name != 'Zlotkey' ;
2.
select employee_id,last_name,salary from employees where salary > (select avg(salary) from employees );
3.
select employee_id,last_name from employees where department_id IN (select department_id from employees where last_name like '%u%');
4.
select last_name,department_id,job_id from employees where department_id IN (select department_id from departments where location_id = 1700);
5.
select last_name,salary from employees where manager_id IN (select employee_id from employees WHERE last_name = 'King');
select * from departments;
6.
select department_id,last_name,job_id from employees where department_id IN (select department_id from departments where DEPARTMENT_NAME = 'Executive');