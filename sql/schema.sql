


-- Creating the students table
CREATE TABLE IF NOT EXISTS students (
    student_id SERIAL PRIMARY KEY,  -- Automatically increments with each new student
    name VARCHAR(100) NOT NULL,      -- Student's full name
    age INT CHECK (age >= 18),       -- Age must be 18 or greater
    major VARCHAR(50),               -- Major field of study
    gpa DECIMAL(3, 2) CHECK (gpa >= 0 AND gpa <= 4.0) -- GPA between 0.0 and 4.0
);

-- Optional: Creating an index to speed up searching by name or major (if needed)
-- CREATE INDEX idx_name ON students (name);
-- CREATE INDEX idx_major ON students (major);

