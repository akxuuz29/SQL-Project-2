USE StudentManagement;

-- Create Courses table
CREATE TABLE Courses (
    Course_ID INT AUTO_INCREMENT PRIMARY KEY,
    Course_name VARCHAR(100) NOT NULL,
    Course_description VARCHAR(255)
);

-- Create Enrolments table
CREATE TABLE Enrolments (
    Enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    Enrolment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(StudentID),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample data
INSERT INTO Courses (course_id, course_name, course_description) VALUES
('Mathematics', 'Advanced Math course'),
('Science', 'Basic Science course'),
('English', 'Advance english course'),
('History', 'Introduction to History');

INSERT INTO Enrolments (Enrolment_id, student_id, course_id, enrolment_date) VALUES
(100, 37275, 1, '2025-06-25'),
(101, 37276, 2, '2025-06-25'),
(102, 37277, 3, '2025-06-27'),
(103, 37278, 4, '2025-06-28'),
(104, 37279, 1, '2025-06-29'),
(105, 37280, 2, '2025-06-29'),
(106, 37281, 3, '2025-06-29'),
(107, 37282, 4, '2025-06-27');
(108, 37283, 1, '2025-06-26');
(109, 37284, 2, '2025-06-26');

-- Task 1: List all students and courses
SELECT s.Name, c.course_name
FROM Students s
INNER JOIN Enrolments e ON s.StudentID = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- Task 2: Number of students in each course
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS NumberOfStudents
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- Task 3: Students with more than one course
SELECT s.StudentID, s.Name, COUNT(e.course_id) AS NumberOfCourses
FROM Enrolments e
JOIN Students s ON e.student_id = s.StudentID
GROUP BY e.student_id, s.Name
HAVING COUNT(e.course_id) > 1;

-- Task 4: Courses with no enrolled students
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.enrolment_id IS NULL;