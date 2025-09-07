-- 1. Aggregation: Find the total number of bookings made by each user
SELECT
    User.user_id,
    User.first_name,
    User.last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM
    User
LEFT JOIN Booking ON User.user_id = Booking.user_id
GROUP BY
    User.user_id, User.first_name, User.last_name;

-- Explanation:
-- - LEFT JOIN ensures all users are included, even those with zero bookings.
-- - COUNT(Booking.booking_id) counts bookings for each user.
-- - GROUP BY groups results by user so each row represents one user.

-- 2. Window function: Rank properties based on the total number of bookings
SELECT
    Property.property_id,
    Property.name,
    COUNT(Booking.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS booking_rank
FROM
    Property
LEFT JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY
    Property.property_id, Property.name;

-- Explanation:
-- - LEFT JOIN includes all properties, even those with zero bookings.
-- - COUNT(Booking.booking_id) counts bookings for each property.
-- - GROUP BY groups results by property.
-- - RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) assigns a rank to each property based on bookings.
--   Properties with the same number of bookings get the same rank (RANK allows ties).