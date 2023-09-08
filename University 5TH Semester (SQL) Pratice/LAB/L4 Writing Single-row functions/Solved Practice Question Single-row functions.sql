1.
  SELECT INITCAP( first_name), LENGTH(first_name) FROM employees; =>lENGTH SHOWS US THE SIZE OF CHAR
2.
    SELECT SYSDATE FROM DUAL;
3.
  SELECT employee_id, last_name, salary, (1.15*salary) AS New_Salary FROM employees;
4.
  SELECT employee_id, last_name, salary, (1.15*salary) AS New_Salary, ((1.15*salary)-salary)
5.
  SELECT last_name, LENGTH(last_name) FROM employees WHERE  last_name LIKE 'A%' OR  last_name LIKE 'J%' OR last_name  LIKE 'M%';
6.
  SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS Months_worked  FROM employees;
7.
  SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date,6),'MONDAY'),'fmDay, "the" Ddspth"of" Month, YYYY') REVIEW FROM employees;
8.
  SELECT last_name, hire_date, TO_CHAR(hire_date,'Day') Day FROM employees ORDER BY TO_CHAR(hire_date-1,'d');
9.
  SELECT last_name, commission_pct, NVL(TO_CHAR(commission_pct),'No commision') AS "NO COMMISSION" FROM employees; = >repalces null values with some values.
