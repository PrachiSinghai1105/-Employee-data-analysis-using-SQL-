

CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT,

    first_name VARCHAR(255),

    last_name VARCHAR(255),

    email_address VARCHAR(255),

    number_of_complaints INT,

PRIMARY KEY (customer_id)

);



ALTER TABLE customers

ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

 

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints) 

VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)


;

CREATE DATABASE IF NOT EXISTS Sales;


CREATE SCHEMA IF NOT EXISTS Sales;



USE Sales;

CREATE TABLE customers                                                 

(

    customer_id INT,

    first_name varchar(255),

    last_name varchar(255),

    email_address varchar(255),

    number_of_complaints int


);



SELECT * FROM sales;


SELECT * FROM sales.sales;

DROP TABLE sales;







CREATE TABLE customers                                                               

(   

    customer_id INT,   

    first_name varchar(255),   

    last_name varchar(255),   

    email_address varchar(255),   

    number_of_complaints int,   

primary key (customer_id)   


);



DROP TABLE sales;

DROP TABLE customers;

DROP TABLE items;


DROP TABLE companies;



CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT,

    first_name VARCHAR(255),

    last_name VARCHAR(255),

    email_address VARCHAR(255),

    number_of_complaints INT,

PRIMARY KEY (customer_id)


);



 ALTER TABLE customers

ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

 

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints) 

VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)


;



CREATE TABLE companies

(

    company_id VARCHAR(255),

    company_name VARCHAR(255) DEFAULT 'X',

    headquarters_phone_number VARCHAR(255),

PRIMARY KEY (company_id),

UNIQUE KEY (headquarters_phone_number)

);


DROP TABLE companies;



ALTER TABLE companies

MODIFY headquarters_phone_number VARCHAR(255) NULL;

 

ALTER TABLE companies


CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;



SELECT

    dept_no

FROM

    departments;

 

SELECT 

    *

FROM


    departments;



SELECT

    *

FROM

    employees

WHERE


    first_name = 'Elvis';



SELECT 

    *

FROM

    employees

WHERE


    first_name = 'Kellie' AND gender = 'F'; 

SELECT

    *

FROM

    employees

WHERE


    first_name = 'Kellie' OR first_name = 'Aruna'; 



SELECT

    *

FROM

    employees

WHERE


    gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');



SELECT

    *

FROM

    employees

WHERE


    first_name IN ('Denis' , 'Elvis');



SELECT

    *

FROM

    employees

WHERE


    first_name NOT IN ('John' , 'Mark', 'Jacob');



FROM

    employees

WHERE

    hire_date LIKE ('%2000%');

 

SELECT 

    *

FROM

    employees

WHERE


    emp_no LIKE ('1000_');



SELECT

    *

FROM

    employees

WHERE

    first_name LIKE ('%JACK%');

SELECT 

    *

FROM

    employees

WHERE


    first_name NOT LIKE ('%Jack%'); 



SELECT

    *

FROM

    salaries;

 

SELECT 

    *

FROM

    salaries

WHERE

    salary BETWEEN 66000 AND 70000

    ;

    

SELECT 

    *

FROM

    employees

WHERE

    emp_no NOT BETWEEN '10004' AND '10012'

    ;

    

SELECT 

    dept_name

FROM

    departments

WHERE


    dept_no BETWEEN 'd003' AND 'd006';



SELECT

    dept_name

FROM

    departments

WHERE


    dept_no IS NOT NULL;



SELECT

    *

FROM

    employees

WHERE

    hire_date >= '2000-01-01'

        AND gender = 'F';

SELECT 

    *

FROM

    salaries

WHERE


    salary > 150000;



----




SELECT DISTINCT

    hire_date

FROM

    employees;



SELECT

    COUNT(*)

FROM

    salaries

WHERE

    salary >= 100000;

SELECT 

    COUNT(*)

FROM


    dept_manager;



SELECT

    *

FROM

    employees


ORDER BY hire_date DESC;



SELECT

    salary, COUNT(emp_no) AS emps_with_same_salary

FROM

    salaries

WHERE

    salary > 80000

GROUP BY salary


ORDER BY salary;



SELECT 

    *, AVG(salary)

FROM

    salaries

WHERE

    salary > 120000

GROUP BY emp_no

ORDER BY emp_no;

 

SELECT 

    *, AVG(salary)

FROM

    salaries

GROUP BY emp_no


HAVING AVG(salary) > 120000;



SELECT

    emp_no, AVG(salary)

FROM

    salaries

GROUP BY emp_no

HAVING AVG(salary) > 120000


ORDER BY emp_no;



SELECT

    emp_no

FROM

    dept_emp

WHERE

    from_date > '2000-01-01'

GROUP BY emp_no

HAVING COUNT(from_date) > 1


ORDER BY emp_no;



SELECT 

    *

FROM

    dept_emp


LIMIT 100;



SELECT

    *

FROM

    titles

LIMIT 10; 

 

insert into titles

(

                emp_no,

    title,

    from_date

)

values

(

                999903,

    'Senior Engineer',

    '1997-10-01'

);

 

SELECT 

    *

FROM

    titles


ORDER BY emp_no DESC;



SELECT

    *

FROM

    dept_emp

ORDER BY emp_no DESC

LIMIT 10;

 

insert into dept_emp

(

                emp_no,

    dept_no,

    from_date,

    to_date

)

values

(

                999903,

    'd005',

    '1997-10-01',

    '9999-01-01'


);



INSERT INTO departments VALUES ('d010', 'Business Analysis');



UPDATE departments

SET 

    dept_name = 'Data Analysis'

WHERE


    dept_no = 'd010';



DELETE FROM departments

WHERE


    dept_no = 'd010';



SELECT

    COUNT(DISTINCT dept_no)

FROM


    dept_emp;



SELECT

    SUM(salary)

FROM

    salaries

WHERE


    from_date > '1997-01-01';



#1

SELECT 

    MIN(emp_no)

FROM

    employees;

#2

SELECT 

    MAX(emp_no)

FROM


    employees;



SELECT

    AVG(salary)

FROM

    salaries

WHERE


    from_date > '1997-01-01';

SELECT

    ROUND(AVG(salary), 2)

FROM

    salaries

WHERE


    from_date > '1997-01-01';



SELECT

    dept_no,

    dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup


ORDER BY dept_no ASC;



SELECT

    IFNULL(dept_no, 'N/A') as dept_no,

    IFNULL(dept_name,

            'Department name not provided') AS dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup


ORDER BY dept_no ASC;



# if you currently have ‘departments_dup’ set up:

ALTER TABLE departments_dup

DROP COLUMN dept_manager;

 

ALTER TABLE departments_dup

CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

 

ALTER TABLE departments_dup

CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

 

# if you don’t currently have ‘departments_dup’ set up

DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup 

(

    dept_no CHAR(4) NULL,

    dept_name VARCHAR(40) NULL

);

 

INSERT INTO departments_dup

(

    dept_no,

    dept_name

)SELECT 

                *

FROM 

                departments;

 

INSERT INTO departments_dup (dept_name) 

VALUES                ('Public Relations');

 

