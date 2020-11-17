                        --SQL FILE OF MY QUERIES--

--1 List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT em.emp_no, em.last_name, em.first_name, em.gender, sa.salary
FROM employees AS em
LEFT JOIN salaries AS sa
ON em.emp_no=sa.emp_no;

--2 List employees who were hired in 1986.

SELECT *
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


--3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dep.dept_no, dep.dept_name, depman.emp_no, emp.last_name, emp.first_name, depandemp.from_date, depandemp.to_date
FROM departments AS dep
LEFT JOIN department_manager AS depman
ON dep.dept_no=depman.dept_no
LEFT JOIN employees AS emp
ON depman.emp_no=emp.emp_no
LEFT JOIN departments_and_employees AS depandemp
ON depandemp.emp_no=emp.emp_no;

--4 List the department of each employee with the following information: employee number, last name, first name, and department name.
--I added the dates from which they started working on those departments.

SELECT depandemp.emp_no, emp.last_name, emp.first_name, dep.dept_name, depandemp.from_date, depandemp.to_date
FROM employees AS emp
LEFT JOIN departments_and_employees AS depandemp
ON depandemp.emp_no=emp.emp_no
LEFT JOIN departments AS dep
ON dep.dept_no=depandemp.dept_no;

--5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name LIKE '%Hercules%'
AND last_name LIKE 'B%';

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name, depandemp.from_date, depandemp.to_date
FROM employees AS emp
LEFT JOIN departments_and_employees AS depandemp
ON emp.emp_no=depandemp.emp_no
LEFT JOIN departments AS dep
on depandemp.dept_no=dep.dept_no
WHERE dep.dept_no='d007';


--7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name, depandemp.from_date, depandemp.to_date
FROM employees AS emp
LEFT JOIN departments_and_employees AS depandemp
ON emp.emp_no=depandemp.emp_no
LEFT JOIN departments AS dep
on depandemp.dept_no=dep.dept_no
WHERE dep.dept_no='d007'

UNION

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name, depandemp.from_date, depandemp.to_date
FROM employees AS emp
LEFT JOIN departments_and_employees AS depandemp
ON emp.emp_no=depandemp.emp_no
LEFT JOIN departments AS dep
on depandemp.dept_no=dep.dept_no
WHERE dep.dept_no='d005';

--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last_name_counts"
FROM employees
GROUP BY last_name
ORDER BY "last_name_counts" DESC;


--Epilogue

SELECT emp.emp_no, emp.first_name,  emp.last_name, emp.gender, emp.hire_date, ti.title, depandemp.from_date, depandemp.to_date, dep.dept_name, sal.salary
FROM employees AS emp
LEFT JOIN departments_and_employees AS depandemp
ON emp.emp_no=depandemp.emp_no
LEFT JOIN departments AS dep
ON depandemp.dept_no=dep.dept_no
LEFT JOIN titles AS ti
ON emp.emp_no=ti.emp_no
LEFT JOIN salaries AS sal
ON emp.emp_no=sal.emp_no
WHERE emp.emp_no=499942;

SELECT * FROM department_manager LIMIT 10;
SELECT * FROM departments LIMIT 10;
SELECT * FROM employees LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM departments_and_employees LIMIT 10;
SELECT * FROM titles LIMIT 10;


