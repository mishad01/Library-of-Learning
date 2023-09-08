1.SELECT LAST_name, salary from employees WHERE SALARY >12000; 
2.SELECT LAST_name, DEPARTMENT_ID from employees WHERE EMPLOYEE_ID =176; 
3.SELECT LASt_name, salary from employees where salary NOT between 5000 AND 12000; 4.SELECT LASt_name, JOB_ID, HIRE_DATE from employees WHERE HIRE_DATE BETWEEN '20-Feb-1998' AND '01-may-1998' order by HIRE_DATE; 
5.SELECT LASt_name, DEPARTMENT_ID from employees where DEPARTMENT_ID IN (20,50) ORDER BY LAST_NAME; 
6.SELECT LASt_name as "employee", salary as "monthlty salary" from employees where salary between 5000 AND 12000 AND department_id in(20,50); SELECT LASt_name, HIRE_DATE from employees WHERE HIRE_DATE LIKE '%94';
7.SELECT LASt_name, HIRE_DATE from employees WHERE HIRE_DATE LIKE '%94';
8.select last_name,job_id from employees where manager_id is NULL;
9.select last_name,salary,commission_pct from employees where commission_pct is not null order by salary DESC, commission_pct DESC;
