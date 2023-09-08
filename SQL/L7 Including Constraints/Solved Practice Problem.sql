1.
create table emp(id number(2), emp_name varchar2(10));
alter table emp add constraint pk_emp_id primary key(id);
2
create table dept11(d_id number(2), dep_name varchar(10));
alter table dept11 add constraint my_deptid_pk primary key(d_id);

3.
alter table emp add(d_id number(2));
alter table emp add constraint my_emp_dept_id_fk foreign key(d_id) references dept11 (d_id);

4.
select constraint_name,constraint_type from user_constraints where table _name = 'emp%' or table_name= 'dept11%';

5.
SELECT object_name, object_type
FROM user_objects
WHERE object_name IN ('EMP', 'DEPT');

6.
alter table emp add(commission number(2));
alter table emp add constraint check_great check(commission>0);

6.
ALTER TABLE EMP
ADD COMMISSION NUMBER(2, 2);

ALTER TABLE EMP
ADD CONSTRAINT chk_commission_positive CHECK (COMMISSION > 0);