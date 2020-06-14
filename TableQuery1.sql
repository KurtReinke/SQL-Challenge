---Import Tables, Schema
---Add keys
---Create Primary Key Tables First
---Drop Tables to rerun
Drop Table titles Cascade;

Create Table titles (
    title_id Varchar(20) Not null,
    title Varchar(50) Not null,
	Primary Key (title_id)
	
);
Drop Table employees Cascade;

Create Table employees (
    emp_no Varchar(50) Not null,
	emp_title Varchar(50) Not null,
    birth_date Date Not null,
    first_name Varchar(50) Not null,
    last_name Varchar(50) Not null,
    sex Varchar(50) Not null,
	hire_date Date Not null,
    Primary Key (emp_no),
	Foreign Key (emp_title) references titles (title_id)
);

Drop Table departments Cascade;

Create Table departments (
    dept_no Varchar(50) Not null,
    dept_name Varchar(50) Not null,
    Primary Key (dept_no)
);

----Add Foreign Keys to additional tables
Drop Table dept_emp;

Create Table dept_emp (
    emp_no Varchar(50) Not null,
    dept_no Varchar(50) Not null,
	Foreign Key (emp_no) references employees (emp_no),
	Foreign Key (dept_no) references departments (dept_no)
);
Drop Table dept_manager;

Create Table dept_manager (
	dept_no Varchar(50) Not null,
	emp_no Varchar(50) Not null,
	Foreign Key (dept_no) references departments (dept_no),
	Foreign Key (emp_no) references employees (emp_no)
	
);
Drop Table salaries;

Create Table salaries (
    emp_no Varchar(50) Not null,
    salary INT Not null,
	Foreign Key (emp_no) references employees (emp_no)
);



