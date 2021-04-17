DROP TABLE retirement_challenge_info CASCADE;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;
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
