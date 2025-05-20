DROP TABLE IF EXISTS students;


-- Creating the students table
CREATE TABLE IF NOT EXISTS students (
    student_id SERIAL PRIMARY KEY,  -- Automatically increments with each new student
    name VARCHAR(100) NOT NULL,      -- Student's full name
    major VARCHAR(50),               -- Major field of study
    class VARCHAR(50) NOT NUll, -- "Freshman", "Post-Graduate"
    membership VARCHAR (50) NOT NULL --"Member, Officer, Guest
);


CREATE TABLE IF NOT EXISTS events (
    event_id SERIAL PRIMARY KEY,    -- Automatically increments with each new event
    event_name VARCHAR(100) NOT NULL,  -- Name of the event
    event_date DATE NOT NULL        -- Date of the event
);

-- Creating a many-to-many relationship between students and events
CREATE TABLE IF NOT EXISTS event_participation (
    student_id INT REFERENCES students(student_id),
    event_id INT REFERENCES events(event_id),
    PRIMARY KEY (student_id, event_id)
);

-- CREATE INDEX idx_name ON students (name);
-- CREATE INDEX idx_major ON students (major);

