--import data from locak to snowflake

create or replace warehouse dev_wh
with warehouse_size ='xsmall'
auto_suspend = 60
auto_resume = TRUE;

create or replace database dev_dev;
use database dev_db;

create or replace schema dev_schema;
use schema dev_schema;

--create table
create or replace table employees(
emp_id int,
first_name string,
last_name string,
department string,
salary number,
hire_date date
);

--create fileformat

create or replace file format csv_format
type = 'csv'
field_delimiter = ','
skip_header = 1
field_optionally_enclosed_by = '"'
trim_space =true
empty_field_as_null = true
compression ='AUTO';


select * from employees;

select max(salary) from employees;

select * from employees
order by salary desc
limit 2;

--to find 2nd highest salary, can use both quesries below
select * from
(select *,row_number()over (order by salary desc) as sal 
from employees
) row_emp
where sal in (2);

