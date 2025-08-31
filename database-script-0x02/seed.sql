-- Sample Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('u1', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'host', CURRENT_TIMESTAMP),
  ('u2', 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', 'guest', CURRENT_TIMESTAMP),
  ('u3', 'Carol', 'Williams', 'carol@example.com', 'hash3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('p1', 'u1', 'Cozy Cottage', 'A small, cozy cottage in the countryside.', 'Countryside', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('p2', 'u1', 'City Apartment', 'Modern apartment in the city center.', 'City Center', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('b1', 'p1', 'u2', '2025-09-10', '2025-09-15', 600.00, 'confirmed', CURRENT_TIMESTAMP),
  ('b2', 'p2', 'u2', '2025-10-01', '2025-10-05', 800.00, 'pending', CURRENT_TIMESTAMP);

-- Sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay1', 'b1', 600.00, CURRENT_TIMESTAMP, 'credit_card');

-- Sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('r1', 'p1', 'u2', 5, 'Wonderful stay!', CURRENT_TIMESTAMP),
  ('r2', 'p2', 'u2', 4, 'Great location, clean apartment.', CURRENT_TIMESTAMP);

-- Sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('m1', 'u2', 'u1', 'Hi, is the cottage available in September?', CURRENT_TIMESTAMP),
  ('m2', 'u1', 'u2', 'Yes, it is available. Let me know your dates.', CURRENT_TIMESTAMP);
