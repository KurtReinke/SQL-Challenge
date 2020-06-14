--Data Analysis

--1.List the following details of each employee: 
	--employee number, last name, first name, sex, and salary.
	--Figure out how to organize by employee number
Select salaries.emp_no, employees.last_name, employees.first_name,
	employees.sex, salaries.salary
From employees
left join salaries on salaries.emp_no = employees.emp_no
--orderby?
order by salaries.salary desc;



--2.List first name, last name, and hire date for employees who
	--were hired in 1986.
---Select empoyees.emp_no, emp.last_name, employees.hire_date
Select employees.first_name, employees.last_name, 
	employees.hire_date 
from employees 
where extract(year from hire_date) = 1986
order by employees.hire_date asc;
--where extract employees.hire_date==1986
---where employees == 1986;

---Bonus count of employees hired in 1986
Select
   COUNT(employees.emp_no)
FROM employees
where extract(year from hire_date) = 1986;


--3.List the manager of each department with the following 
	--information: department number, department name, the 
	--manager's employee number, last name, first name.
	--groupby dm dept no then add others
	--group_by dm.dept_no, Select d.dept_no, d.dept_name, d.emp_no, employees.first_name, employees.last_name
Select distinct on (dm.dept_no) d.dept_no, d.dept_name, dm.emp_no, 
	employees.last_name, employees.first_name
from dept_manager as dm
inner join departments as d on dm.dept_no= d.dept_no
inner join employees on dm.emp_no = employees.emp_no
--where upper(d.dept_no) = ()
--where lower(d.dept_no) = ()
--order by employees.last_name
order by dm.dept_no;

--4.List the department of each employee with the following 
	--information: employee number, last name, first name, and 
	--department name.
--Select employees.emp_no, employees.last_name, employees.first_name, employees.emp_no, departments.dept_name
Select distinct on (employees.emp_no) employees.emp_no, employees.last_name, 
	employees.first_name, d.dept_name
from employees
left join dept_emp as de on employees.emp_no = de.emp_no
left join departments as d on de.dept_no = d.dept_no
--order by d.dept_name;
--order by employees.emp_no;
order by employees.emp_no, d.dept_name;


--5.List first name, last name, and sex for employees whose 
	--first name is "Hercules" and last names begin with "B."
select employees.last_name, employees.first_name, employees.sex
from employees
where (employees.first_name = 'Hercules') and 
	--employees.last_name == "B"
	employees.last_name like 'b%'
order by employees.sex desc, employees.last_name;

--6.List all employees in the Sales department, including their
	--employee number, last name, first name, and department name.
---
--select employees.emp_no, employees.last_name, employees.first_name, d.dept_name
--from employees
--inner join new_emp as ne on employees.emp_no = d.emp_no
--where d.dept_name = 'Sales';

--Create new table for 6
--- select employees.emp_no
---from employees into new_emp
---
Drop Table new_emp;

select distinct on (emp_no) *
into new_emp
from dept_emp
order by emp_no;
----------------------------------

select employees.emp_no, employees.last_name, employees.first_name, d.dept_name
from employees
inner join new_emp as ne on employees.emp_no = ne.emp_no
inner join departments as d on ne.dept_no = d.dept_no
where d.dept_name = 'Sales';



--7.List all employees in the Sales and Development departments,
	--including their employee number, last name, first name, 
	--and department name.
select employees.emp_no, employees.last_name, employees.first_name, d.dept_name
from employees
inner join new_emp as ne on employees.emp_no = ne.emp_no
inner join departments as d on ne.dept_no = d.dept_no
where d.dept_name = 'Sales' Or 
	d.dept_name = 'Development';


--8.In descending order, list the frequency count of employee 
	--last names, i.e., how many employees share each last name.
--select employees.last_name.count as Frequency
--from employees
--groupby last_name
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency asc;















