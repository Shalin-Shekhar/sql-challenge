--List the following details of each employee: employee number, last name, first name, gender, and salary.
select E.emp_no as "Employee Number", E.last_name as "Last Name", E.first_name as "First Name",
E.gender, S.salary
	from employee E
	inner join emp_salary S on E.emp_no = S.emp_no
--Where current_date >= S.from_date and current_date <= S.to_date
;

--List employees who were hired in 1986.
Select E.emp_no as "Employee Number", E.last_name as "Last Name", E.first_name as "First Name",
E.hire_date
from employee E
Where to_char(E.hire_date,'YYYY') = '1986'
;

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.
Select D.dept_no "department number", D.dept_name "department name", E.emp_no "employee number", 
E.last_name "last name",E.first_name "first name", dm.from_date "start date",
DM.to_date "End employment dates"
from department D
inner join dept_manager DM ON D.dept_no = DM.dept_no
inner join employee E ON DM.manager_no = E.emp_no
where current_date between dm.from_date and dm.to_date --The current manager
;


--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select E.emp_no,E.last_name,E.first_name,D.dept_name
from employee E
inner join emp_dept_map ED on E.emp_no = ED.emp_no
inner join department D on ED.dept_no = D.dept_no
where current_date between ED.from_date and ed.to_date
;

--List all employees whose first name is "Hercules" and last names begin with "B."
Select *
from employee E
where E.first_name = 'Hercules' and E.last_name like 'B%'
;

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
select E.emp_no,E.last_name,E.first_name,D.dept_name
from employee E
inner join emp_dept_map ED on E.emp_no = ED.emp_no
inner join department D on ED.dept_no = D.dept_no
where current_date between ED.from_date and ed.to_date
and D.dept_name = 'Sales'
;

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select E.emp_no,E.last_name,E.first_name,D.dept_name
from employee E
inner join emp_dept_map ED on E.emp_no = ED.emp_no
inner join department D on ED.dept_no = D.dept_no
where current_date between ED.from_date and ed.to_date
and D.dept_name in ('Sales','Development')
;

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select last_name, count(E.emp_no) AS "Frequency Count"
from employee E
group by E.last_name
order by "Frequency Count" desc
;


