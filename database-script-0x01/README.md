# AirBnB Database Schema

This directory contains the SQL script (`schema.sql`) for creating the core tables and relationships for the AirBnB database project.

## Contents

- `schema.sql`: SQL statements to create tables, set primary and foreign keys, define constraints, and add indexes.

## Usage

1. Open your SQL client (e.g., PostgreSQL, MySQL).
2. Run the `schema.sql` script to create the database schema.
3. The script will set up all necessary tables, relationships, and constraints for the AirBnB system.

## Tables Defined

- **User**: Stores user information (guests, hosts, admins).
- **Property**: Stores property listings.
- **Booking**: Stores booking records.
- **Payment**: Stores payment details for bookings.
- **Review**: Stores user reviews for properties.
- **Message**: Stores messages between users.

## Notes

- Ensure your database supports UUID and the specified constraints.
- Indexes are created for optimal query performamce
