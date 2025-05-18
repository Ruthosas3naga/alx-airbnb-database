"high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses)."
🧍 User Table
user_id (used in JOINs and WHERE)
email (used in WHERE for login/search)

🏠 Property Table
property_id (JOINs with Booking/Review)
location (used in WHERE filters)
pricepernight (used in filters/sorting)

📘 Booking Table
booking_id (used in JOINs)
user_id (used in JOINs)
property_id (used in JOINs)
start_date, end_date (used in filters, sorting)
status (used in WHERE)

