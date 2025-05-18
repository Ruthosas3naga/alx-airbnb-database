"a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause."
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

"a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received."
SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank_with_ties
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id
) AS property_bookings;
