-- Students Table
CREATE TABLE Students (
  student_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT UNIQUE,
  dob DATE,
  dept TEXT
);

-- Courses Table
CREATE TABLE Courses (
  course_id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  credits INTEGER CHECK (credits > 0)
);

-- Grades Table
CREATE TABLE Grades (
  grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER,
  course_id INTEGER,
  grade REAL CHECK (
    grade >= 0
    AND grade <= 100
  ),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Students
INSERT INTO
  Students (name, email, dob, dept)
VALUES
  (
    'Amit Sharma',
    'amit@example.com',
    '2002-05-15',
    'CSE'
  ),
  (
    'Priya Das',
    'priya@example.com',
    '2001-11-21',
    'ECE'
  ),
  (
    'Rahul Mehta',
    'rahul@example.com',
    '2003-01-10',
    'CSE'
  );

-- Insert Courses
INSERT INTO
  Courses (title, credits)
VALUES
  ('Database Systems', 4),
  ('Data Structures', 3),
  ('Digital Electronics', 3);

-- Insert Grades
INSERT INTO
  Grades (student_id, course_id, grade)
VALUES
  (1, 1, 85.50),
  (1, 2, 90.00),
  (2, 1, 78.00),
  (2, 3, 88.25),
  (3, 2, 92.75),
  (3, 1, 80.00);