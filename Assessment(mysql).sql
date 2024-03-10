create database assessment;
use assessment;
/*What will be the result of the query below?
SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races)
Explain your answer and also provide an alternative version of this query that will avoid the issue that it exposes.*/

CREATE TABLE runners (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
-- Insert data into the "runners" table
INSERT INTO runners (id, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Boby Louls'),
(5, 'Lisa Romero');
-- Create the "races" table
CREATE TABLE races (
    id INTEGER PRIMARY KEY,
    event VARCHAR(255),
    winner_id INTEGER
);


-- Insert data into the "races" table
INSERT INTO races (id, event, winner_id) VALUES
(1, '100 meter dash', 2),
(2, '500 meter dash', 3),
(3, 'cross-country', 2),
(4, 'triathlon', NULL);

SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races);
-- issue is here no records are showing and here we have to find runners who has not wom any race
-- Alternate 
SELECT *
FROM runners
WHERE id NOT IN (SELECT winner_id FROM races WHERE winner_id IS NOT NULL);
------------------------------------------------------------------------------------------------------------------
-- question 2
create table test_a (id numeric);
create table test_b(id numeric);
INSERT INTO test_a (id) VALUES (10), (20), (30), (40), (50);
select * from test_a;
INSERT INTO test_b (id) VALUES (10),(30),(50);
select * from test_b;
-- Write a query to fetch values in table test_a that are and not in test_b without using the NOT keyword.
SELECT a.id
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;
---------------------------------------------------------------------------------------------------------
# Question 3
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

INSERT INTO users (user_id, user_name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Boby Louls'),
(5, 'Lisa Romero');
select * from users;
CREATE TABLE training_details (
    user_training_id INT PRIMARY KEY,
    user_id INT,
    training_id INT,
    training_date DATE
);

INSERT INTO training_details (user_training_id, user_id, training_id, training_date) VALUES
(1, 1, 1, '2015-08-02'),
(2, 2, 1, '2015-08-03'),
(3, 3, 2, '2015-08-02'),
(4, 4, 2, '2015-08-04'),
(5, 2, 2, '2015-08-03'),
(6, 1, 1, '2015-08-02'),
(7, 3, 2, '2015-08-04'),
(8, 4, 3, '2015-08-03'),
(9, 1, 4, '2015-08-03'),
(10, 3, 1, '2015-08-02'),
(11, 4, 2, '2015-08-04'),
(12, 3, 2, '2015-08-02'),
(13, 1, 1, '2015-08-02'),
(14, 4, 3, '2015-08-03');

SELECT user_id, training_id, training_date
FROM training_details
GROUP BY user_id, training_id, training_date
HAVING COUNT(*) > 1
ORDER BY training_date DESC;
---------------------------------------------------------------------------------------------
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(255) NOT NULL,
    Salary INT,
    Manager_Id INT
);

INSERT INTO Employee (Emp_Id, Emp_Name, Salary, Manager_Id) VALUES
(10, 'Anil', 50000, 18),
(11, 'Vikas', 75000, 16),
(12, 'Nisha', 40000, 18),
(13, 'Nidhi', 60000, 17),
(14, 'Priya', 80000, 18),
(15, 'Mohit', 45000, 18),
(16, 'Rajesh', 90000, NULL),
(17, 'Raman', 55000, 16),
(18, 'Santosh', 65000, 17);

SELECT 
    e.Manager_Id,
    m.Emp_Name AS Manager,
    ROUND(AVG(e.Salary), 0) AS Average_Salary_Under_Manager
FROM 
    Employee e
JOIN 
    Employee m ON e.Manager_Id = m.Emp_Id
WHERE 
    e.Manager_Id IN (16, 17, 18)
GROUP BY 
    e.Manager_Id
ORDER BY 
    e.Manager_Id;


