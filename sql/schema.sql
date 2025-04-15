DROP TABLE IF EXISTS students;


-- Creating the students table
CREATE TABLE IF NOT EXISTS students (
    student_id SERIAL PRIMARY KEY,  -- Automatically increments with each new student
    name VARCHAR(100) NOT NULL,      -- Student's full name
    major VARCHAR(50),               -- Major field of study
    class VARCHAR(50) NOT NUll, -- "Freshman", "Post-Graduate"
    membership VARCHAR (50) NOT NULL --"Member, Officer, Guest
);

-- Optional: Creating an index to speed up searching by name or major (if needed)
-- CREATE INDEX idx_name ON students (name);
-- CREATE INDEX idx_major ON students (major);

