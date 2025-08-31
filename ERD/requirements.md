# Entity-Relationship Diagram (ERD) Specification

## Entities and Attributes

**User**

- user_id (PK, UUID, Indexed)
- first_name (VARCHAR, NOT NULL)
- last_name (VARCHAR, NOT NULL)
- email (VARCHAR, UNIQUE, NOT NULL)
- password_hash (VARCHAR, NOT NULL)
- phone_number (VARCHAR, NULL)
- role (ENUM: guest, host, admin, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Property**

- property_id (PK, UUID, Indexed)
- host_id (FK → User.user_id)
- name (VARCHAR, NOT NULL)
- description (TEXT, NOT NULL)
- location (VARCHAR, NOT NULL)
- pricepernight (DECIMAL, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

**Booking**

- booking_id (PK, UUID, Indexed)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date (DATE, NOT NULL)
- end_date (DATE, NOT NULL)
- total_price (DECIMAL, NOT NULL)
- status (ENUM: pending, confirmed, canceled, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Payment**

- payment_id (PK, UUID, Indexed)
- booking_id (FK → Booking.booking_id)
- amount (DECIMAL, NOT NULL)
- payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

**Review**

- review_id (PK, UUID, Indexed)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (INTEGER, CHECK: 1-5, NOT NULL)
- comment (TEXT, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Message**

- message_id (PK, UUID, Indexed)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body (TEXT, NOT NULL)
- sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## Relationships

- **User** (host) 1---\* **Property**
- **User** (guest) 1---\* **Booking**
- **Property** 1---\* **Booking**
- **Booking** 1---1 **Payment**
- **User** 1---\* **Review**
- **Property** 1---\* **Review**
- **User** 1---\* **Message** (as sender)
- **User** 1---\* **Message** (as recipient)

## Instructions for ER Diagram

1. Identify all entities and their attributes as listed above.
2. Draw relationships between entities using crow's foot notation:
   - One-to-many between User and Property (host_id).
   - One-to-many between Property and Booking.
   - One-to-many between User and Booking.
   - One-to-one between Booking and Payment.
   - One-to-many between User and Review.
   - One-to-many between Property and Review.
   - One-to-many between User and Message (sender/recipient).
3. Use Draw.io or similar tool to create the ER diagram visually.
4. Save/export your diagram in the `ERD/` directory of your repository.

## Indexing and Constraints

- Primary keys are indexed.
- Additional indexes: User.email, Property.property_id, Booking.booking_id.
- Foreign key constraints as specified above.
- Unique and non-null constraints as specified above.
