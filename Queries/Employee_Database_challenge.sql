-- Deliverable 1: The Number of Retiring Employees by Title

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

SELECT emp_no, first_name, last_name
FROM employees;


CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR (50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no,title,from_date)
);

SELECT title, from_date, to_date
FROM titles;

SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
					rt.emp_no,
					rt.first_name,
					rt.last_name,
					rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles

-- Deliverable 2: The Employees Eligible for the Mentorship Program
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT * FROM mentorship_eligibilty

-- Deliverable 3: Summary

-- 3 a).How many roles will need to be filled as the "silver tsunami" begins to make an impact?

SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM titles_department

SELECT td.dept_name, td.title, COUNT(td.title) 
INTO roles_to_fill
FROM (SELECT title, dept_name from titles_department) as td
GROUP BY td.dept_name, td.title
ORDER BY td.dept_name DESC;

SELECT * FROM roles_to_fill

-- 3 b).Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

SELECT COUNT (td.title), td.dept_name, td.title
INTO qualified_mentors
FROM (SELECT title, dept_name from titles_department) as td
WHERE td.title IN ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager')
GROUP BY td.dept_name, td.title
ORDER BY td.dept_name DESC;

SELECT * FROM qualified_mentors

ALTER TABLE roles_to_fill
RENAME COLUMN count TO roles_to_fill

SELECT * FROM roles_to_fill

ALTER TABLE roles_to_fill
RENAME COLUMN roles_to_fill TO number_roles_to_fill

SELECT * FROM roles_to_fill

ALTER TABLE qualified_mentors
RENAME COLUMN count TO number_of_mentors

SELECT * FROM qualified_mentors

ALTER TABLE qualified_mentors
RENAME COLUMN dept_name TO qualified_mentor_dept

ALTER TABLE qualified_mentors
RENAME COLUMN title TO qualified_mentor_title

SELECT * FROM qualified_mentors

SELECT DISTINCT ON (rtf.number_roles_to_fill) 
	rtf.number_roles_to_fill,
	rtf.dept_name,
	rtf.title,
	qm.number_of_mentors,
	qm.qualified_mentor_dept,
	qm.qualified_mentor_title
INTO roles_vs_mentors
FROM roles_to_fill as rtf
INNER JOIN qualified_mentors as qm
ON (rtf.number_roles_to_fill = qm.number_of_mentors)
ORDER BY rtf.number_roles_to_fill DESC;

SELECT * FROM roles_vs_mentors

