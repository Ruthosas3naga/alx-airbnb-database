

-- Initial complex query
-- performance.sql

-- Initial complex query (with AND in WHERE clause)
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON pay.booking_id = b.id
WHERE b.status = 'confirmed'
  AND b.start_date >= CURRENT_DATE
ORDER BY b.start_date DESC
LIMIT 100;


"Analyse with EXPLAIN"
EXPLAIN ANALYZE
SELECT ...

-- Refactored query for better performance
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON pay.booking_id = b.id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC
LIMIT 100;
