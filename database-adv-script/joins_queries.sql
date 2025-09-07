-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM
    Booking
INNER JOIN User ON Booking.user_id = User.user_id;

-- Explanation:
-- INNER JOIN: Only matching rows from both tables.
-- Returns only rows where there is a matching user for each booking.
-- Bookings without a valid user are excluded.

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT
    Property.property_id,
    Property.name,
    Property.location,
    Review.review_id,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN Review ON Property.property_id = Review.property_id;

-- Explanation:
-- LEFT JOIN: All rows from the left table, matched rows from the right, NULLs if no match.
-- Returns all properties, and any matching reviews.
-- Properties without reviews will have NULLs in the review columns.

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status
FROM
    User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;

-- Explanation:
-- FULL OUTER JOIN: All rows from both tables, matched where possible, NULLs where not.
-- Returns all users and all bookings.
-- Users without bookings and bookings without users (if any) are included, with NULLs in the missing columns.