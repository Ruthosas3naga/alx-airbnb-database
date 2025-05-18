

-- Initial complex query
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON pay.booking_id = b.id;

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
