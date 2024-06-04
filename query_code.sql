-- Q1(List the employee number, last name, first name, sex, and salary of each employee)
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no;

--Q2 (List the first name, last name, and hire date for the employees who were hired in 1986.)
select first_name, last_name, date_part('year', hire_date)
from employees
Where date_part('year', hire_date) = 1986;

--Q3 (List the manager of each department along with their:
--department number, department name, employee number, last name, and first name.)
select 
	dm.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
From
	employees e
join
	dept_manager dm on e.emp_no = dm.emp_no
join
	department d on dm.dept_no = d.dept_no

--Q4 (List the department number for each employee along with that employee’s:
--employee number, last name, first name, and department name.)
select
	d.dept_name,
	de.dept_no,
	e.emp_no,
	e.first_name,
	e.last_name
from 
	employees e
join 
	dept_employees de on e.emp_no = de.emp_no
join
	department d on de.dept_no = d.dept_no
--Q5 (List first name, last name,
--and sex of each employee whose first name is Hercules and whose last name begins with the letter B.)
select
	first_name,
	last_name,
	sex
from
	employees
where
	first_name = 'Hercules' 
And
	last_name Like 'B%'
	;

--Q6 (List each employee in the Sales department, including their employee number, last name, and first name.)
select
	e.emp_no,
	e.first_name,
	e.last_name
from 
	employees e
join 
	dept_employees de on e.emp_no = de.emp_no
join
	department d on de.dept_no = d.dept_no
where
	d.dept_name = 'Sales';

--Q7 (List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name (4 points))
select
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
from 
	employees e
join 
	dept_employees de on e.emp_no = de.emp_no
join
	department d on de.dept_no = d.dept_no
where
	d.dept_name in ('Sales', 'Development')
	

--Q8 (List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name) (4 points))
select
	last_name,
	count(*) as name_count
from
	employees
group by
	last_name
order by
	name_count desc;








