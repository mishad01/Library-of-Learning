1.
create table EMPLOYEE10 (id number(4),last_name varchar2(25),first_name varchar2(25),userid varchar2(25),salary number(9,2));
select* from employee10;
2.
insert into employee10 (id,last_name,first_name,userid,salary) values(1,'Patel', 'Ralph','rptael',895);
insert into employee10 (id,last_name,first_name,userid,salary) values(2,'Dances','Betty','bdances',860);
insert into employee10 (id,last_name,first_name,userid,salary) values(3,'Biri','Ben','bbiri',1100);
insert into employee10 (id,last_name,first_name,userid,salary) values(4,'Newman','Chad','cnewman',750);
truncate table employee10;
3.
alter table employee10 modify(id number(8),last_name varchar2(50),first_name varchar2(25));
4.
5.
update employee10 set last_name = 'Drexler' where id = 3;
6.
update employee10 set salary = 1000 where salary<900;
7.
delete employee10 where first_name = 'Betty' and last_name = 'Dances';
8.
rename employees13 to EMP81;
9.
alter table EMP81 drop column first_name;
select * from emp81;
10.
select * from employees;
create table employee75 as select employee_id,first_name,last_name,salary from employees;
select * from employee75;