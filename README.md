# Pewlett-Hackard-Analysis

## Purpose
Pewlett-Hackard is one of the oldest and largest companies in the US with several thousand employess about to enter retirement therefore creating a "silver tsunami. The purpose of this analysis is to prepare Pewlett-Hackard for the loss of experienced employees through retirement over the next four years by putting hiring action plans together. This will be done first by determining the number of retiring employees by title and then identifying current employees that are eligible to participate in a mentorship program to ensure a smooth transition for the company, it's employees and future new hires. 

## Results 

### Tables of Retiring Employees
* The list includes the employee number, employee's first name, employee's last name, employee's title, employee hire date and the date they changed titles/left     Pewlett-Hackard. 

* The table has 133,776 rows which is an enormus amount of employee's on the verge of retirement. 

![retirement_titles_tabl](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/retirement_titles_table.png?raw=true)
  
*Retiring Employees Table (First Table)*

* On a closer analysis of the data in the initial retiring employees table there are duplicate entries because some employees changed positions in the course of their     tenure at Pewlett-Hackard. Therefore a dedupe query needed to executed to remove the duplicate entries.  

* After the duplicate rows were removed the new table of employees retiring in the next four years was reduced from 133,776 rows to 90398 with the columns cleaned up       omitting the employee start date and end date. 

![unique_titles_table](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/unique_titles_table.png?raw=true)

*Retiring Employees Table (Second Table)*

* Finally query was written to group the sum of employees with the same titles that are going to be retiring over the next four years to give a high level overview of roles that Pewlett-Hackard is going to have to replace. 

![retiring_titles_table](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/retiring_titles_table.png?raw=true)

*Retiring Title Sum Table

### Table of Employees Eligible for Mentorship Program
* The table which examines the Pewlett-Hackard employees eligible for a mentorship program contains columns that show data for employee number, first name, last name,   birth date, from date, to date and title.

* When ran the query returned 1549 rows. 

* To ensure that the table is pulling only employees that are eligible for the mentorship program a 'WHERE' and 'AND' clause filter was utilized to filter on the to     date column selecting only data that matched the perameters of '9999-01-01'. Additionally to isolate the list to only those employees about to retire the 'AND'         clause was used to select employees whose birthdays fell between '1965-01-01' and '1965-12-31'.

* The table is then sorted by decending order. 

![mentorship_eligibilty_table](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibilty_table.png?raw=true)

*Mentorship Eligibilty Table*

## Summary
With the impending 'Silver Tsunami' on it's way to Pewlett-Hackard putting an action plan on how to address retirement and hiring issue is imperative to circumvent workforce conitnuity. The above tables do perform some valuable insight however, I created three more tables that further examines the hiring data by breaking down how many roles will need to be filled to make an impact in addition to a table that displays how many roles are needed vs. how many mentors there currently are. 

### Table of How Many Roles to Fill
The below table breaks down how many roles need to be filled according to deptartment name with a further breakdown of the role that needs to be replaced. 

![roles_to_fill_table](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/roles_to_fill_table.png?raw=true)

*Roles to Fill Table

### Table of Qualified Mentors
Similar to the Roles to Fill table above, the below table breaks down the Qualified Mentors by count, department and title. In this table I selected only the titles of management or senior level employees, i.e. ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager') by using the 'WHERE' and 'IN' clauses to filter the table. 

![qualified_mentors_table](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/qualified_mentors_table.png?raw=true)

*Qualified Mentors Table*

### Table of Roles vs. Mentors 
In this table I first changed the Qualified Mentors table headers for clarity from count, dept_name and title to number_of_mentors, qualified_mentor_dept and qualified_mentor_title. I then joined the Roles to Fill table with the Qualified Mentors table to create a table that shows both roles that need to be filled and how many eligible mentors there are at Pewlett-Hackard. The results show that Pewlett-Harckard is almost completely equipped to handle the infulx of employees being hired and mentored with the exception of the Research Manager role. 

![roles_vs_mentors_table](https://github.com/adecoste2/Pewlett-Hackard-Analysis/blob/main/Images/roles_vs_mentors_table.png?raw=true)

*Roles vs. Mentors Table*



*For CSV files click [here](https://github.com/adecoste2/Pewlett-Hackard-Analysis/tree/main/Data) and for SQL Query files click [here](https://github.com/adecoste2/Pewlett-Hackard-Analysis/tree/main/Queries).









