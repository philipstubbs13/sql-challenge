/*
List the following details of each employee:
employee number, last name, first name, gender, and salary.
*/
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;

/*
List employees who were hired in 1986.
*/
select *
from employees
where extract(year from employees.hire_date) = 1986;

/*
List the manager of each department with the following information:
department number, department name, the manager's employee number,
last name, first name, and start and end employment dates.
*/
select d.dept_no, d.dept_name,  dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from employees as e
inner join dept_manager as dm
on e.emp_no = dm.emp_no
inner join departments as d
on dm.dept_no = d.dept_no;

/*
List the department of each employee with the following information:
employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no;

/*
List all employees whose first name is "Hercules" and last names begin with "B."
*/
select *
from employees as e
where e.first_name = 'Hercules'
and e.last_name like 'B%';

/*
List all employees in the Sales department,
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

/*
List all employees in the Sales and Development departments,
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development';

/*
In descending order, list the frequency count of employee last names,
i.e., how many employees share each last name.
*/
select last_name, count(last_name) as last_name_frequency_count
from employees as e
group by last_name
order by last_name_frequency_count desc;

/*
Evidence in hand, you march into your boss's office and present the visualization.
With a sly grin, your boss thanks you for your work.
On your way out of the office, you hear the words, "Search your ID number."
You look down at your badge to see that your employee ID number is 499942.
*/
select e.emp_no, e.last_name, e.first_name
from employees as e
where e.emp_no = 499942;
