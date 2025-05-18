-- User table indexes
CREATE INDEX idx_user_user_id ON "User"(user_id);
CREATE INDEX idx_user_email ON "User"(email);

-- Property table indexes
CREATE INDEX idx_property_property_id ON "Property"(property_id);
CREATE INDEX idx_property_location ON "Property"(location);
CREATE INDEX idx_property_price ON "Property"(pricepernight);

-- Booking table indexes
CREATE INDEX idx_booking_booking_id ON "Booking"(booking_id);
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);
CREATE INDEX idx_booking_dates ON "Booking"(start_date, end_date);
CREATE INDEX idx_booking_status ON "Booking"(status);


"before indexing"
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000'
  AND status = 'confirmed';

"After indexing"
-- After running the index script
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000'
  AND status = 'confirmed';
