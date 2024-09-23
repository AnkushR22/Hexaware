CREATE DATABASE SDB;
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

drop database sdb;








