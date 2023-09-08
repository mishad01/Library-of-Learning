1. true 
2. false 
3. false 
4. select max(salary),min(salary),avg(salary) from employees; 
5. select max(salary),min(salary),sum(salary),avg(salary) from employees group by job_id; 
6. select round(max(salary)) as Maximum, round(min(salary)) as Minimum, round(sum(salary)) as Sum, round(avg(salary)) as Averege from employees; 
7. select job_id,max(salary) as Maximum,min(salary) as Minimum,sum(salary) as Sum,avg(salary) as Averege from employees group by job_id order by job_id; 
8. select min(salary),max(salary),sum(salary),avg(salary) from employees group by job_id; 
9. select job_id,count(*) from employees group by job_id; select * from employees;
10.select department_id as NAME, count(department_id) as "NUMBER OF PEOPLE" , avg(salary) as SALARY from employees group by department_id order by department_id;
11.select * from employees
select count(employee_id) as TOTAL,hire_date as 19995 Where hire_date like '95%' from employees group by employee_id;