--1) Retrieve data from employees table
SELECT emp_no
	,first_name
	,last_name
FROM employees_2
--2) Retrieve data from titles table
SELECT title
	,from_date
	,to_date
FROM titles_2

--3) Create a new table using INTO clause
SELECT emp_no
	,first_name
	,last_name
INTO retirement_info_challenge
FROM employees_2
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Select * from retirement_info_challenge

--4-to-7) Join both tables on the primay key. Using the INNER JOIN for these tables
SELECT rci.emp_no,
	rci.first_name,
	rci.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM retirement_info_challenge as rci
LEFT JOIN titles_2 as ti
ON rci.emp_no = ti.emp_no
ORDER BY rci.emp_no;

SELECT * FROM retirement_titles;

--9
SELECT first_name
	,last_name
	,title
FROM retirement_titles

--10 - 14-- Use DISTINCT ON statement
SELECT DISTINCT ON (emp_no) emp_no
	,first_name
	,last_name
	,title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no,
  	to_date DESC
	
SELECT * FROM unique_titles;

--15 Employees about to retire
SELECT title
INTO retiring_titles
FROM unique_titles

SELECT DISTINCT COUNT (title),title FROM retiring_titles
GROUP BY title
ORDER BY count DESC

--DELIVERABLE 2

--1 SELECTING FROM MULTIPLE TABLES
SELECT e.emp_no
	,e.first_name
	,e.last_name
	,e.birth_date
	,de.from_date
	,de.to_date
	,ti.title
FROM employees_2 as e
LEFT JOIN department_employees as de ON e.emp_no = de.emp_no
LEFT JOIN titles_2 as ti ON e.emp_no = ti.emp_no

--2 USE DISTINCT ON
SELECT DISTINCT ON (e.emp_no) e.emp_no
	,e.first_name
	,e.last_name
	,e.birth_date
	,de.from_date
	,de.to_date
	,ti.title
INTO mentorship_eligibility
FROM employees_2 as e
LEFT JOIN department_employees as de ON e.emp_no = de.emp_no
LEFT JOIN titles_2 as ti ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no,
		de.to_date DESC
	






