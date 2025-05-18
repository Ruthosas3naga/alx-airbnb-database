-- partitioning.sql

-- Step 1: Create the parent table
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    status VARCHAR(20),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- Step 2: Create child partitions (e.g., for 2024, 2025)
CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- You can add more partitions as needed for future years

"before partioning"
-- On original unpartitioned table
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';

"After partioning"
-- On partitioned table
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';
