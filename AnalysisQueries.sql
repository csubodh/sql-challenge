/*
List the employee number, last name, first name, sex, and salary of each employee.
*/
select "Employees"."Emp_no", "Last_name", "First_name", "sex", "Salary" 
from "Employees"
join "Salaries"
on "Employees"."Emp_no" = "Salaries"."Emp_no" 

/*
List the first name, last name, and hire date for the employees who were hired in 1986.
*/
select "Employees"."Emp_no", "Last_name", "First_name", "sex", "Salary", "Hire_date"
from "Employees"
join "Salaries"
on "Employees"."Emp_no" = "Salaries"."Emp_no" 
where EXTRACT(YEAR from "Hire_date") > 1986
order by "Hire_date" ASC

/*
List the manager of each department along with their department number, department name, employee number, last name, and first name.
*/
select "Last_name","First_name", "Dept_name", "Departments"."Dept_no", "Employees"."Emp_no" from "Departments"
left outer join "Dept_manager"
on "Departments"."Dept_no" = "Dept_manager"."Dept_no"
left outer join "Employees"
on "Dept_manager"."Emp_no" = "Employees"."Emp_no"


/*
List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
*/
select "Employees"."Emp_no", "Last_name", "First_name", "Dept_Emp"."Dept_no", "Departments"."Dept_name" 
from "Employees"
join "Dept_Emp"
on "Employees"."Emp_no" = "Dept_Emp"."Emp_no"
join "Departments"
on "Dept_Emp"."Dept_no" = "Departments"."Dept_no"
order by 4 desc

/*
List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
*/
select "First_name", "Last_name", "sex"
from "Employees" 
where "First_name" = 'Hercules' and "Last_name" like 'B%'
order by 2

/*
List each employee in the Sales department, including their employee number, last name, and first name.
*/
select "Employees"."Emp_no", "Last_name", "First_name"
from "Employees"
join "Dept_Emp"
on "Employees"."Emp_no" = "Dept_Emp"."Emp_no"
join "Departments"
on "Dept_Emp"."Dept_no" = "Departments"."Dept_no"
where "Departments"."Dept_name" = 'Sales'


/*
List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
*/
select "Employees"."Emp_no", "Last_name", "First_name", "Dept_Emp"."Dept_no", "Departments"."Dept_name" 
from "Employees"
join "Dept_Emp"
on "Employees"."Emp_no" = "Dept_Emp"."Emp_no"
join "Departments"
on "Dept_Emp"."Dept_no" = "Departments"."Dept_no"
where "Departments"."Dept_name" in ('Sales', 'Development')
order by 5

/*
List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
*/
select "Last_name", count(*) as "Count of same last name"
from "Employees" 
group by 1
order by 2 desc
