CREATE DATABASE if not exists SDB;
USE SDB;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


-- drop database sdb;

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES 
('Arjun', 'Kapoor', '2000-05-10', 'arjun.kapoor@example.com', '9876543210'),
('Anjali', 'Nair', '1999-08-21', 'anjali.nair@example.com', '9876543211'),
('Ravi', 'Shah', '1998-12-15', 'ravi.shah@example.com', '9876543212'),
('Kavya', 'Joshi', '2001-03-30', 'kavya.joshi@example.com', '9876543213'),
('Dev', 'Chatterjee', '2000-07-18', 'dev.chatterjee@example.com', '9876543214'),
('Neha', 'Mishra', '1999-02-25', 'neha.mishra@example.com', '9876543215'),
('Manish', 'Rao', '2000-09-05', 'manish.rao@example.com', '9876543216'),
('Pooja', 'Desai', '2001-11-12', 'pooja.desai@example.com', '9876543217'),
('Siddharth', 'Malhotra', '1998-04-23', 'siddharth.malhotra@example.com', '9876543218'),
('Tanya', 'Sen', '1999-06-14', 'tanya.sen@example.com', '9876543219');

INSERT INTO Teacher (first_name, last_name, email)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com'),
('Priya', 'Reddy', 'priya.reddy@example.com'),
('Rahul', 'Patel', 'rahul.patel@example.com'),
('Sneha', 'Iyer', 'sneha.iyer@example.com'),
('Vikram', 'Kumar', 'vikram.kumar@example.com'),
('Aishwarya', 'Singh', 'aishwarya.singh@example.com'),
('Rohan', 'Mehta', 'rohan.mehta@example.com'),
('Nisha', 'Verma', 'nisha.verma@example.com'),
('Raj', 'Chaudhary', 'raj.chaudhary@example.com'),
('Suman', 'Gupta', 'suman.gupta@example.com');

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 3, 1),
('Physics', 4, 2),
('Chemitsry', 3, 3),
('Biology', 4, 4),
('Engish Literature', 3, 5),
('Computer Science', 5, 6),
('History', 3, 7),
('Economics', 4, 8),
('psychology', 3, 9),
('Philosophy', 3, 10);

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-1'),
(2, 2, '2024-01-16'),
(3, 3, '2024-01-17'),
(4, 4, '2024-01-18'),
(5, 5, '2024-01-19'),
(6, 6, '2024-01-20'),
(7, 7, '202-01-21'),
(8, 8, '2024-01-22'),
(9, 9, '2024-01-23'),
(10, 10, '2024-01-24');

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 50000, '2024-02-01'),
(2, 75000, '2024-02-02'),
(3, 60000, '2024-02-03'),
(4, 85000, '2024-02-04'),
(5, 70000, '2024-02-05'),
(6, 90000, '2024-02-06'),
(7, 65000, '2024-02-7'),
(8, 80000, '2024-02-08'),
(9, 55000, '2024-02-09'),
(10, 95000, '2024-02-10');

-- show databases
-- drop database sdb;

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('Rohan', 'Sharma', '1995-08-15', 'rohan.sharma@example.com', '9876543210');

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, '2024-09-19');  -- enrolled in maths 

UPDATE Teacher
SET email = 'rajesh.gupta@newemail.com'
WHERE teacher_id = 1;

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 1;

UPDATE Courses
SET teacher_id = 2
WHERE course_id = 2;

DELETE FROM Enrollments
WHERE student_id = 1;

UPDATE Payments
SET amount = 5000
WHERE student_id = 3;

-- drop database sdb;

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.first_name = 'Amit' AND s.last_name = 'Sharma'
GROUP BY s.first_name, s.last_name;

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id;

SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Mathematics';

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

SELECT s.first_name, s.last_name, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING course_count > 1;

SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.teacher_id IS NULL;

 -- drop database sdb; 

SELECT first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    GROUP BY student_id
    HAVING COUNT(course_id) > 1
);

SELECT course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM Enrollments
);

SELECT first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT teacher_id
    FROM Courses
);

SELECT first_name, last_name
FROM Students
WHERE student_id NOT IN (
    SELECT student_id
    FROM Payments
);

SELECT course_name
FROM Courses
WHERE course_id = (
    SELECT course_id
    FROM Enrollments
    GROUP BY course_id
    ORDER BY COUNT(student_id) DESC
    LIMIT 1
);

SELECT first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE course_id = (SELECT course_id FROM Courses WHERE course_name = 'Mathematics')
)
AND student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE course_id = (SELECT course_id FROM Courses WHERE course_name = 'Physics')
);

SELECT AVG(YEAR(CURDATE()) - YEAR(date_of_birth)) AS average_age
FROM Students;

SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT course_id FROM Enrollments);

 SELECT p.student_id, e.course_id, SUM(p.amount) AS total_payment
 FROM Payments p
 JOIN Enrollments e ON p.student_id = e.student_id
GROUP BY p.student_id, e.course_id;


SELECT student_id, COUNT(payment_id) AS payment_count
FROM Payments
GROUP BY student_id
HAVING COUNT(payment_id) > 1;

SELECT student_id, SUM(amount) AS total_payment
FROM Payments
GROUP BY student_id;

SELECT Courses.course_name, COUNT(Enrollments.student_id) AS student_count
FROM Courses
JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_name;

SELECT student_id, AVG(amount) AS average_payment
FROM Payments
GROUP BY student_id;








