//Question for all these in README.TXT file

  
1.TRUE 
2.FALSE
3.SELECT employee_id,last_name,salary,(salary* 12) as "ANNUAL SALARY" fROM employees;
4.select * from departments;
5.select LAST_NAME,JOB_ID,hire_date,PHONE_NUMBER FROM EMPLOYEES;
6.select employee_id,last_name,job_id,hire_date as "StartDate" from employees;
7.select distinct job_id FROM EMPLOYEES;
8.select last_name || ', ' || job_id as "Employee and Title" from employees;
9.select EMPLOYEE_ID || ', ' ||FIRST_NAME|| ', ' || LAST_NAME|| ', ' || EMAIL|| ', ' || PHONE_NUMBER || ', ' ||HIRE_DATE || ', ' ||JOB_ID || ', ' ||SALARY || ', ' ||COMMISSION_PCT|| ', ' || MANAGER_ID || ', ' ||DEPARTMENT_ID as "THE_OUTPUT" from employees;

/*Discussion
1.We have learned if (SELECT last_name, job_id, salary AS Sal
FROM employees;) statement was succefully executed or not.
2.We have learned (SELECT *
FROM job_grades;) if a statement was succefully executed or not.
3.Here we have learned how we can find Annual Salary by  multiplying salary with 12.
4.Here we have learned how to find ALL data of DEPARTEMNTS  .
5.Here we have learned how to find ALL data of Employees.
6.Here we learner how to find select LAST_NAME,JOB_ID,hire_date,PHONE_NUMBER FROM EMPLOYEES;
7.We learned how to find unique value using Distinct
8.We learned here how to Display the last name concatenated with the job ID, separated by a comma and space and give a different coloum name
9. Here we learned query to display all the data from the EMPLOYEES table. Separate each column by a comma and Name the column THE_OUTPUT. */
