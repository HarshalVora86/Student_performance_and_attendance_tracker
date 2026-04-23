CREATE DATABASE IF NOT EXISTS student_tracker;

USE student_tracker;

DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    department_id   INT          PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Information Technology'),
('Electronics Engineering'),
('Mechanical Engineering'),
('Civil Engineering'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Business Administration'),
('Data Science');

CREATE TABLE Faculty (
    faculty_id    INT          PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    phone_number  VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO Faculty (faculty_id, name, email, phone_number, department_id) VALUES
(1,  'Dr. Rajesh Kumar',    'rajesh.kumar@college.edu',   '9876543210', 1),
(2,  'Prof. Sneha Sharma',  'sneha.sharma@college.edu',   '9876543211', 2),
(3,  'Dr. Amit Patel',      'amit.patel@college.edu',     '9876543212', 3),
(4,  'Prof. Priya Singh',   'priya.singh@college.edu',    '9876543213', 4),
(5,  'Dr. Vikram Mehta',    'vikram.mehta@college.edu',   '9876543214', 5),
(6,  'Prof. Anita Desai',   'anita.desai@college.edu',    '9876543215', 6),
(7,  'Dr. Suresh Nair',     'suresh.nair@college.edu',    '9876543216', 7),
(8,  'Prof. Kavya Reddy',   'kavya.reddy@college.edu',    '9876543217', 8),
(9,  'Dr. Mohan Joshi',     'mohan.joshi@college.edu',    '9876543218', 9),
(10, 'Prof. Pooja Verma',   'pooja.verma@college.edu',    '9876543219', 10);

CREATE TABLE Courses (
    course_id   INT          PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id  INT,
    FOREIGN KEY (faculty_id)
        REFERENCES Faculty(faculty_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO Courses (course_id, course_name, faculty_id) VALUES
(1,  'Database Management Systems', 1),
(2,  'Web Development', 2),
(3,  'Digital Electronics', 3),
(4,  'Fluid Mechanics', 4),
(5,  'Structural Engineering', 5),
(6,  'Linear Algebra', 6),
(7,  'Quantum Physics', 7),
(8,  'Organic Chemistry', 8),
(9,  'Machine Learning', NULL),
(10, 'Cloud Computing', NULL);

CREATE TABLE Students (
    student_id     INT          PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    dob            DATE         NOT NULL,
    gender         ENUM('Male','Female','Other') NOT NULL,
    email          VARCHAR(100) UNIQUE,
    phone_number   VARCHAR(15),
    address        VARCHAR(255),
    admission_date DATE         NOT NULL,
    department_id  INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO Students (student_id, name, dob, gender, email, phone_number, address, admission_date, department_id) VALUES
(1,  'Aarav Shah',     '2002-03-15', 'Male',   'aarav.shah@gmail.com',    '9000000001', 'Surat, Gujarat',       '2021-07-01', 1),
(2,  'Priya Mehta',    '2002-06-22', 'Female', 'priya.mehta@gmail.com',   '9000000002', 'Mumbai, Maharashtra',  '2021-07-01', 2),
(3,  'Rohan Patel',    '2001-11-10', 'Male',   'rohan.patel@gmail.com',   '9000000003', 'Ahmedabad, Gujarat',   '2020-07-01', 1),
(4,  'Sneha Joshi',    '2003-01-05', 'Female', 'sneha.joshi@gmail.com',   '9000000004', 'Pune, Maharashtra',    '2022-07-01', 3),
(5,  'Karan Singh',    '2002-08-19', 'Male',   'karan.singh@gmail.com',   '9000000005', 'Delhi',                '2021-07-01', 4),
(6,  'Ananya Reddy',   '2003-04-30', 'Female', 'ananya.reddy@gmail.com',  '9000000006', 'Hyderabad, Telangana', '2022-07-01', 5),
(7,  'Vikram Nair',    '2001-09-14', 'Male',   'vikram.nair@gmail.com',   '9000000007', 'Kochi, Kerala',        '2020-07-01', 6),
(8,  'Meera Pillai',   '2002-12-25', 'Female', NULL,                      '9000000008', 'Chennai, Tamil Nadu',  '2021-07-01', 7),
(9,  'Arjun Desai',    '2003-07-08', 'Male',   'arjun.desai@gmail.com',   '9000000009', 'Vadodara, Gujarat',    '2022-07-01', 8),
(10, 'Pooja Sharma',   '2002-02-14', 'Female', 'pooja.sharma@gmail.com',  '9000000010', 'Jaipur, Rajasthan',    '2021-07-01', 9);

CREATE TABLE Enrollments (
    enrollment_id   INT  PRIMARY KEY,
    student_id      INT  NOT NULL,
    course_id       INT  NOT NULL,
    enrollment_date DATE NOT NULL,
    UNIQUE KEY uq_student_course (student_id, course_id),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1,  1,  1,  '2021-07-15'),
(2,  2,  2,  '2021-07-15'),
(3,  3,  1,  '2020-07-15'),
(4,  4,  3,  '2022-07-15'),
(5,  5,  4,  '2021-07-15'),
(6,  6,  5,  '2022-07-15'),
(7,  7,  6,  '2020-07-15'),
(8,  8,  7,  '2021-07-15'),
(9,  9,  8,  '2022-07-15'),
(10, 10, 9,  '2021-07-15');

CREATE TABLE Attendance (
    attendance_id   INT  PRIMARY KEY,
    student_id      INT  NOT NULL,
    course_id       INT  NOT NULL,
    attendance_date DATE NOT NULL,
    status          ENUM('Present','Absent','Late') NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(1,  1, 1, '2024-01-10', 'Present'),
(2,  1, 1, '2024-01-17', 'Present'),
(3,  1, 1, '2024-01-24', 'Present'),
(4,  1, 1, '2024-01-31', 'Present'),
(5,  1, 1, '2024-02-07', 'Absent'),
(6,  2, 2, '2024-01-10', 'Absent'),
(7,  2, 2, '2024-01-17', 'Absent'),
(8,  2, 2, '2024-01-24', 'Present'),
(9,  2, 2, '2024-01-31', 'Absent'),
(10, 2, 2, '2024-02-07', 'Present'),
(11, 3, 1, '2024-01-10', 'Present'),
(12, 3, 1, '2024-01-17', 'Present'),
(13, 3, 1, '2024-01-24', 'Present'),
(14, 3, 1, '2024-01-31', 'Present'),
(15, 3, 1, '2024-02-07', 'Present'),
(16, 4, 3, '2024-01-10', 'Present'),
(17, 4, 3, '2024-01-17', 'Late'),
(18, 4, 3, '2024-01-24', 'Absent'),
(19, 4, 3, '2024-01-31', 'Present'),
(20, 4, 3, '2024-02-07', 'Absent'),
(21, 5, 4, '2024-01-10', 'Absent'),
(22, 5, 4, '2024-01-17', 'Absent'),
(23, 5, 4, '2024-01-24', 'Present'),
(24, 5, 4, '2024-01-31', 'Absent'),
(25, 5, 4, '2024-02-07', 'Absent'),
(26, 6, 5, '2024-01-10', 'Present'),
(27, 6, 5, '2024-01-17', 'Present'),
(28, 6, 5, '2024-01-24', 'Present'),
(29, 6, 5, '2024-01-31', 'Present'),
(30, 6, 5, '2024-02-07', 'Present');


CREATE TABLE Grades (
    grade_id       INT           PRIMARY KEY,
    student_id     INT           NOT NULL,
    course_id      INT           NOT NULL,
    marks_obtained DECIMAL(5,2)  NOT NULL
                   CHECK (marks_obtained BETWEEN 0 AND 100),
    grade          VARCHAR(2),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Grades (grade_id, student_id, course_id, marks_obtained, grade) VALUES
(1,  1,  1,  92.00, 'A+'),  
(2,  2,  2,  36.50, 'F'),   
(3,  3,  1,  87.00, 'A'),   
(4,  4,  3,  76.00, 'B+'),  
(5,  5,  4,  38.00, 'F'),   
(6,  6,  5,  95.00, 'A+'),  
(7,  7,  6,  68.00, 'C'),   
(8,  8,  7,  55.00, 'C'),   
(9,  9,  8,  81.00, 'A'),   
(10, 10, 9,  91.50, 'A+');  

INSERT INTO Students (student_id, name, dob, gender, email, phone_number, address, admission_date, department_id)
VALUES 
(11, 'Riya Gupta', '2003-09-12', 'Female', 'riya.gupta@gmail.com', '9000000011', 'Surat, Gujarat', '2022-07-01', 1);

INSERT INTO Faculty (faculty_id, name, email, phone_number, department_id)
VALUES 
(11, 'Prof. Sunil Rao', 'sunil.rao@college.edu', '9876543220', 1);

INSERT INTO Courses (course_id, course_name, faculty_id)
VALUES 
(11, 'Artificial Intelligence Basics', 11);

INSERT INTO Enrollments (student_id, course_id, enrollment_date, enrollment_id) 
VALUES (11, 11, '2022-07-15', 11);


UPDATE Students
SET phone_number = '9898989898', address = 'Ahmedabad, Gujarat'
WHERE student_id = 1;

UPDATE Students
SET email = 'aarav.166@gmail.com'
WHERE student_id = 1;

DELETE FROM Students WHERE student_id = 11;

SELECT * FROM Students;

SELECT s.student_id, s.name, d.department_name
FROM  Students s
JOIN  Departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

SELECT s.name, g.marks_obtained, c.course_name
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Courses c ON g.course_id  = c.course_id
ORDER BY g.marks_obtained DESC
LIMIT  10;

SELECT s.name, COUNT(*) AS total_classes,
       SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_count,
       ROUND(
           SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
       ) AS attendance_pct
FROM Attendance a
JOIN Students   s ON a.student_id = s.student_id
GROUP BY s.student_id, s.name
HAVING attendance_pct < 75;

SELECT s.name, g.marks_obtained,
       ROUND(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attendance_pct
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
JOIN Attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name, g.marks_obtained
HAVING attendance_pct < 50 AND g.marks_obtained < 40;

SELECT DISTINCT s.name
FROM  Students s
LEFT JOIN Grades g ON s.student_id = g.student_id
LEFT JOIN (
    SELECT student_id,
           ROUND(SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS att_pct
    FROM  Attendance
    GROUP BY student_id
) att ON s.student_id = att.student_id
WHERE  g.marks_obtained > 90 OR att.att_pct = 100;

SELECT f.faculty_id, f.name, f.email
FROM Faculty f
WHERE f.faculty_id NOT IN (
    SELECT DISTINCT faculty_id FROM Courses WHERE faculty_id IS NOT NULL
);

SELECT student_id, name, email, gender
FROM Students
ORDER BY name ASC;

SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM Departments d
LEFT JOIN Students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY student_count DESC;

SELECT c.course_name, ROUND(AVG(g.marks_obtained), 2) AS avg_marks
FROM Courses c
JOIN Grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name
ORDER BY avg_marks DESC;

SELECT s.name,
 COUNT(*) AS total_classes,
 ROUND(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attendance_pct
FROM Students s
JOIN Attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name;

SELECT c.course_name,
       MAX(g.marks_obtained) AS highest_marks,
       MIN(g.marks_obtained) AS lowest_marks,
       ROUND(AVG(g.marks_obtained), 2) AS avg_marks
FROM Courses c
JOIN Grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;

SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC;

SELECT f.name AS faculty_name, c.course_name, d.department_name
FROM Faculty f
JOIN Courses c ON f.faculty_id    = c.faculty_id
JOIN Departments d ON f.department_id = d.department_id
ORDER BY f.name;

SELECT s.student_id, s.name, s.email, d.department_name
FROM Students s
INNER JOIN Departments d ON s.department_id = d.department_id;

SELECT s.student_id, s.name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;
 
SELECT c.course_name
FROM Faculty f
RIGHT JOIN Courses c ON f.faculty_id = c.faculty_id
WHERE c.faculty_id IS NULL;

SELECT s.name AS student_name, g.marks_obtained
FROM Students s
LEFT JOIN Grades g ON s.student_id = g.student_id
UNION
SELECT s.name AS student_name, g.marks_obtained
FROM Students s
RIGHT JOIN Grades g ON s.student_id = g.student_id;

SELECT s.name, g.marks_obtained
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
WHERE g.marks_obtained > (SELECT AVG(marks_obtained) FROM Grades)
ORDER BY g.marks_obtained DESC;

SELECT c.course_name, f.name AS faculty_name , f.faculty_id AS years_of_experience
FROM Courses c
JOIN Faculty f ON c.faculty_id = f.faculty_id
WHERE f.faculty_id IN (
    SELECT faculty_id FROM Faculty WHERE faculty_id <= 5
);

SELECT s.name, (SELECT COUNT(*) FROM Attendance a WHERE  a.student_id = s.student_id AND a.status = 'Absent') AS absent_count
FROM Students s
WHERE (SELECT COUNT(*) FROM Attendance a WHERE  a.student_id = s.student_id AND a.status = 'Absent') > 2;

SELECT MONTHNAME(attendance_date) AS month_name,
       COUNT(*) AS total_records,
       SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS present_count,
       SUM(CASE WHEN status = 'Absent'  THEN 1 ELSE 0 END) AS absent_count
FROM Attendance
GROUP BY MONTH(attendance_date), MONTHNAME(attendance_date)
ORDER BY MONTH(attendance_date);
 
SELECT name, admission_date, TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years_since_admission
FROM Students
ORDER BY years_since_admission DESC;

SELECT s.name, DATE_FORMAT(a.attendance_date, '%d-%m-%Y') AS formatted_date, a.status
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
ORDER BY a.attendance_date;

SELECT faculty_id, UPPER(name) AS faculty_name_upper, email FROM Faculty;

SELECT student_id, TRIM(name) AS trimmed_name FROM Students;

SELECT student_id, name, IFNULL(email, 'Email Not Provided') AS email_display FROM Students;

SELECT s.name, g.marks_obtained,
       DENSE_RANK() OVER (ORDER BY g.marks_obtained DESC) AS student_rank
FROM Students s
JOIN Grades   g ON s.student_id = g.student_id;

SELECT DATE_FORMAT(enrollment_date, '%Y-%m') AS enrollment_month,
       COUNT(*) AS enrolled_this_month,
       SUM(COUNT(*)) 
       OVER (ORDER BY DATE_FORMAT(enrollment_date, '%Y-%m') 
       ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM Enrollments
GROUP BY DATE_FORMAT(enrollment_date, '%Y-%m');

SELECT s.name, g.marks_obtained,
       CASE
           WHEN g.marks_obtained > 90 THEN 'Excellent'
           WHEN g.marks_obtained BETWEEN 75 AND 90 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS performance_level
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
ORDER BY g.marks_obtained DESC;
 
SELECT s.name,
       ROUND(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attendance_pct,
       CASE
           WHEN ROUND(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) > 80
               THEN 'Regular'
           WHEN ROUND(SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) BETWEEN 50 AND 80
               THEN 'Irregular'
           ELSE 'Defaulter'
       END AS attendance_category
FROM Attendance a
JOIN Students   s ON a.student_id = s.student_id
GROUP BY s.student_id, s.name
ORDER BY attendance_pct DESC;







