"SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries."
-- Sample high-usage query
SELECT * 
FROM Booking 
WHERE user_id = 101 AND start_date BETWEEN '2025-05-01' AND '2025-05-31';

SET profiling = 1;
-- Run your query
SELECT * FROM Booking WHERE user_id = 101 AND start_date BETWEEN '2025-05-01' AND '2025-05-31';
SHOW PROFILE FOR QUERY 1;

"Identifying bottlenecks"
example: Query does a sequential scan on Booking despite filtering by user_id and start_date.

"Solution: create a composite index"
CREATE INDEX idx_booking_user_start ON Booking(user_id, start_date);
"Retest query"
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE user_id = 101 AND start_date BETWEEN '2025-05-01' AND '2025-05-31';

Performance Monitoring Report – May 2025

Queries Monitored:
1. Booking search by user and date
2. Property listing filtered by location and price
3. Booking + Payment join

Findings:
- Booking queries were performing full table scans.
- Property filter was using index on `location` but not on `price`.
- Join query used nested loops without index on `payment.booking_id`.

Actions Taken:
- Added composite index: (user_id, start_date) on Booking
- Added composite index: (location, price) on Property
- Added index on payment.booking_id

Results:
- Booking query time reduced from 120ms → 18ms
- Property filter query time reduced from 90ms → 20ms
- Join query reduced from 200ms → 45ms

Conclusion:
Query plans now use index scans and partition pruning.
Next Steps: Monitor slow queries via logs; evaluate monthly partitioning for Booking if needed.
