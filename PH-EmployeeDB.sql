--Correct Code to work with

CREATE TABLE departments_2(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE(dept_name)
);

CREATE TABLE employees_2(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no));

CREATE TABLE dept_manager_2_1(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments_2 (dept_no));

CREATE TABLE salaries_2(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees_2(emp_no),
	PRIMARY KEY (emp_no));
    
CREATE TABLE titles_2(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY(emp_no) REFERENCES employees_2(emp_no));
--Retirement eligibility

SELECT first_name, last_name
FROM employees_2
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

--Number of People Retiring
--Count the number of people retiring
SELECT COUNT(first_name) 
FROM employees_2
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

--Create a new table
SELECT first_name, last_name
INTO retirement_info
FROM employees_2
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

--Create a new table
SELECT first_name, last_name
INTO retirement_info
FROM employees_2
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')


--JOIN THE TABLES

DROP TABLE retirement_info CASCADE;
--Update the retirement_info with the employee number emp_no

SELECT emp_no, first_name,last_name
INTO retirement_info
FROM employees_2
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Check the table

SELECT * FROM retirement_info;

--INNER JOIN CODE :

SELECT departments_2.dept_name,
	dept_manager_2_1.emp_no,
	dept_manager_2_1.from_date,
	dept_manager_2_1.to_date
FROM departments_2
INNER JOIN dept_manager_2_1
ON departments_2.dept_no = dept_manager_2_1.dept_no;

--LEFT JOIN CODE:
-- Joining retirement_info and dept_emp tables