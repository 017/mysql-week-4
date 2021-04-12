DELIMITER $$
CREATE PROCEDURE 1990_employees()
BEGIN
SELECT * FROM employees WHERE hire_date >= 1990-01-01 limit 1000;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE gendered_employees(IN genderParameter CHAR(1))
BEGIN 
SELECT emp_no, first_name, last_name from employees where gender=genderParameter limit 20;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE gendered_employee_birthdate(IN genderParameter CHAR(1))
BEGIN
SELECT emp_no, first_name, last_name, birth_date from employees where gender=genderParameter limit 20;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_employee(
    IN emp_num_input INT,
    IN fn_input VARCHAR(30),
    IN ln_input VARCHAR(30),
    IN gender_input CHAR(1), 
    IN dob_input DATE, 
    IN hiredate_input DATE)
BEGIN
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (emp_num_input, dob_input, fn_input, ln_input, gender_input, hiredate_input); 
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_title(
    IN emp_num_input INT,
    IN title_name_input VARCHAR(30)
    IN from_input DATE, 
    IN to_input DATE)
BEGIN
INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES (emp_num_input, title_name_input, from_input, to_input); 
END$$
DELIMITER ;

CALL add_title(017, 'Developer', curdate(), 01/01/2552);
CALL add_employee(017, "Robert", "Ochi", "M", 01/01/1990, curdate());