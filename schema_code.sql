--create titles table
CREATE TABLE titles(
	title_id varchar(5) primary key,
	title varchar(50) not null
);

-- create employees table
CREATE TABLE employees(
	emp_no int primary key,
	emp_title_id varchar(5) not null,
	birth_date date not null,
	first_name text not null,
	last_name text not null,
	sex varchar(1) not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id)
);

--create salaries table
create table salaries(
	emp_no int primary key,
	salary int not null,
	foreign key (emp_no) references employees(emp_no)
);

--create the department table
create table department(
	dept_no varchar(4) primary key not null,
	dept_name text not null	
);

--create the department employees table (use compsite key?)
create table dept_employees(
	emp_no int,
	dept_no varchar(4) not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references department(dept_no),
	primary key (emp_no, dept_no)
);

--create the department managers table (make compsite key?)
create table dept_manager(
	dept_no varchar(4) not null,
	emp_no int not null,
	foreign key (dept_no) references department(dept_no),
	foreign key (emp_no) references employees(emp_no),
	primary key (dept_no, emp_no)
	
);