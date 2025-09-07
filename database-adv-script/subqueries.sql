-- 1. Non-correlated subquery: Find all properties where the average rating is greater than 4.0
SELECT
    property_id,
    name,
    location
FROM
    Property
WHERE
    property_id IN (
        SELECT
            property_id
        FROM
            Review
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );

-- Explanation:
-- The subquery (inside IN) calculates the average rating for each property.
-- It returns property_ids with average rating > 4.0.
-- The outer query selects properties matching those IDs.
-- This is a non-correlated subquery because it runs independently of the outer query.

-- 2. Correlated subquery: Find users who have made more than 3 bookings
SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    User u
WHERE
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;

-- Explanation:
-- The subquery counts bookings for each user (b.user_id = u.user_id).
-- It runs for each row in the outer query (User table).
-- Only users with more than 3 bookings are returned.
-- This is a correlated subquery because it references the outer query (u.user_id).

-- Difference:
-- Non-correlated subqueries run independently of the outer query.
-- Correlated subqueries depend on values from the outer query and run for each row.