# Hotel Management Database 📊

Welcome to the **Hotel Management Database** project! This repository contains a relational database schema designed to manage hotel operations, including hotels, rooms, guests, reservations, staff, and services. The database is implemented using SQL (Oracle-compatible syntax) and includes sample data for testing and exploration.

---

## 🌟 Overview

This project models a hotel management system with the following key entities:
- **Hotels**: Store information about hotel locations and ratings.
- **Rooms**: Manage room details, availability, and pricing.
- **Guests**: Track guest personal information.
- **Reservations**: Handle booking details for rooms.
- **Staff**: Manage employee details and their assigned services.
- **Services**: Catalog additional services offered (e.g., Wi-Fi, breakfast).

---

## 🚀 Setup Instructions

To set up and run this database project, follow these steps:

1. **Prerequisites**:
   - Oracle Database (or a compatible SQL environment like Oracle SQL Developer).
   - Ensure you have privileges to create tables, views, sequences, and triggers.

2. **Database Creation**:
   - Clone this repository to your local machine.
   - Run the SQL script `Assigment1.sql` to create the tables, insert sample data, create views, sequences, and triggers.
     ```bash
     sqlplus username/password @Assigment1.sql
     ```

3. **Verify Setup**:
   - After running the script, check the tables and views using the provided `SELECT` statements at the end of `Assigment1.sql`.
   - Example: `SELECT * FROM hotel;` to verify hotel data.

---

## 🗄️ Database Schema

The database consists of the following tables, as depicted in the ERD:

- **Hotel**:
  - `hotel_id` (INT, Primary Key)
  - `name` (VARCHAR2(255), NOT NULL)
  - `city` (VARCHAR2(255), NOT NULL)
  - `address` (VARCHAR2(255), NOT NULL)
  - `star_rating` (NUMBER(3,1), NOT NULL)

- **Room**:
  - `room_number` (INT, Primary Key)
  - `hotel_id` (INT, Foreign Key references Hotel)
  - `type` (VARCHAR2(255), NOT NULL)
  - `price_per_night` (NUMBER(10,2), NOT NULL)
  - `availability` (CHAR(1), NOT NULL)

- **Guest**:
  - `guest_id` (INT, Primary Key)
  - `first_name` (VARCHAR2(255), NOT NULL)
  - `last_name` (VARCHAR2(255), NOT NULL)
  - `email` (VARCHAR2(255), NOT NULL)
  - `phone` (VARCHAR2(20), NOT NULL)

- **Reservation**:
  - `reservation_id` (INT, Primary Key)
  - `guest_id` (INT, Foreign Key references Guest)
  - `room_number` (INT, Foreign Key references Room)
  - `check_in_date` (DATE, NOT NULL)
  - `check_out_date` (DATE, NOT NULL)

- **Service**:
  - `service_id` (INT, Primary Key)
  - `hotel_id` (INT, Foreign Key references Hotel)
  - `name` (VARCHAR2(255), NOT NULL)
  - `description` (CLOB)
  - `price` (NUMBER(10,2), NOT NULL)

- **Staff**:
  - `staff_id` (INT, Primary Key)
  - `hotel_id` (INT, Foreign Key references Hotel)
  - `first_name` (VARCHAR2(255), NOT NULL)
  - `last_name` (VARCHAR2(255), NOT NULL)
  - `position` (VARCHAR2(255), NOT NULL)
  - `salary` (NUMBER(10,2), NOT NULL)
  - `service_id` (INT, Foreign Key references Service)

- **Guest_Service** (Junction Table):
  - `guest_id` (INT, Foreign Key references Guest)
  - `service_id` (INT, Foreign Key references Service)
  - `quantity` (INT, NOT NULL)
  - Composite Primary Key: (`guest_id`, `service_id`)

### Relationships:
- A Hotel **has** many Rooms and Services.
- A Guest **can order many** Services (via Guest_Service).
- A Guest **can make many** Reservations.
- Staff **have** a Service they are responsible for.

---

## 🛠️ Usage

### Sample Queries

Here are some example queries to interact with the database:

1. **View Total Room Prices per Hotel**:
   ```sql
   SELECT * FROM view_hotel_room_prices;
   ```
   - This view calculates the total price of rooms per hotel using the `SUM` function.

2. **Check Available Rooms**:
   ```sql
   SELECT * FROM view_available_rooms;
   ```
   - Displays rooms where `availability = '1'`.

3. **Reservation Details with Guest Info**:
   ```sql
   SELECT * FROM view_reservation_guest_infoo;
   ```
   - Joins `Reservation`, `Guest`, and `Room` tables to show reservation details with guest names.

4. **Guests with the Most Expensive Rooms**:
   ```sql
   SELECT * FROM view_guests_with_expensive_rooms;
   ```
   - Identifies guests who booked the most expensive rooms using a subquery.

### Triggers and Sequences

- **Sequence for Reservation IDs**:
  - A sequence `seq_reservation_id` auto-generates unique `reservation_id` values starting from 100.
  
- **Trigger for Auto-Inserting Reservation IDs**:
  - The trigger `trg_insert_reservation_id` automatically assigns a new `reservation_id` from the sequence when inserting a new reservation.

- **Trigger for Room Availability Check**:
  - The trigger `trg_check_room_availability` ensures a room is available (`availability = '1'`) before allowing a reservation or update.

---

## 🔮 Future Improvements

- **Add More Constraints**: Introduce additional checks, such as ensuring `check_out_date` is after `check_in_date`.
- **Indexing**: Create indexes on frequently queried columns (e.g., `room_number`, `guest_id`) to improve performance.
- **Advanced Views**: Develop more complex views, such as calculating total revenue per hotel (including room and service costs).
- **User Interface**: Build a front-end application to interact with the database, using a web framework like React or a desktop app.
- **Data Validation**: Implement more triggers for data integrity, such as validating email formats or ensuring unique phone numbers for guests.

---

## 📜 License

This project is licensed under the MIT License - feel free to use and modify it as needed.