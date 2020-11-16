
CREATE TABLE "employees" (
    "emp_no" INT NOT NULL PRIMARY KEY,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(4)   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(7) NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(30) NOT NULL
);

CREATE TABLE "departments_and_employees" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(7)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "department_manager" (
    "dept_no" VARCHAR(7)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM department_manager LIMIT 10;
SELECT * FROM departments LIMIT 10;
SELECT * FROM employees LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM departments_and_employees LIMIT 10;

--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT em.emp_no, em.last_name, em.first_name, em.gender, sa.salary
FROM employees AS em
LEFT JOIN salaries AS sa
ON em.emp_no=sa.emp_no;

--List employees who were hired in 1986.

SELECT *
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'


--DROP TABLE employees;
--DROP TABLE salaries;
--DROP TABLE titles;
--DROP TABLE departments;
--DROP TABLE departments_and_employees;
--DROP TABLE department_manager;




