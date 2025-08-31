# Database Normalization to 3NF

## Step 1: First Normal Form (1NF)

- All tables have atomic values (no repeating groups or arrays).
- Each attribute contains only one value per row.
- Example: `User.email` is a single value, not a list.

## Step 2: Second Normal Form (2NF)

- All tables are in 1NF.
- Every non-primary-key attribute is fully functionally dependent on the whole primary key.
- No partial dependencies in tables with composite keys.
- Example: In `Booking`, all attributes depend on `booking_id` (the PK).

## Step 3: Third Normal Form (3NF)

- All tables are in 2NF.
- No transitive dependencies (non-key attributes do not depend on other non-key attributes).
- Example: In `User`, `role` depends only on `user_id`, not on other attributes.

## Review of Schema

- **User**: No redundant data; all attributes depend on `user_id`.
- **Property**: All attributes depend on `property_id`; `host_id` is a foreign key, no transitive dependencies.
- **Booking**: All attributes depend on `booking_id`; foreign keys reference other tables, no transitive dependencies.
- **Payment**: All attributes depend on `payment_id`; `booking_id` is a foreign key, no transitive dependencies.
- **Review**: All attributes depend on `review_id`; foreign keys, no transitive dependencies.
- **Message**: All attributes depend on `message_id`; sender and recipient are foreign keys, no transitive dependencies.

## Conclusion

- The schema is in 3NF:
  - Each table has a primary key.
  - All attributes are fully dependent on the primary key.
  - No transitive dependencies or redundant data.
- No further normalization is required
