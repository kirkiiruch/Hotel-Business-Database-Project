-- Создание таблицы hotel
CREATE TABLE hotel (
    hotel_id INT PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    city VARCHAR2(255) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    star_rating NUMBER(3,1) NOT NULL
);

-- Создание таблицы service
CREATE TABLE service (
    service_id INT PRIMARY KEY,
    hotel_id INT NOT NULL,
    name VARCHAR2(255) NOT NULL,
    description CLOB,
    price NUMBER(10,2) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Создание таблицы guest
CREATE TABLE guest (
    guest_id INT PRIMARY KEY,
    first_name VARCHAR2(255) NOT NULL,
    last_name VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL,
    phone VARCHAR2(20) NOT NULL
);

-- Создание таблицы room
CREATE TABLE room (
    room_number INT PRIMARY KEY,
    hotel_id INT NOT NULL,
    type VARCHAR2(255) NOT NULL,
    price_per_night NUMBER(10,2) NOT NULL,
    availability CHAR(1) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Создание таблицы reservation
CREATE TABLE reservation (
    reservation_id INT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_number INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
    FOREIGN KEY (room_number) REFERENCES room(room_number)
);

-- Создание таблицы guest_service
CREATE TABLE guest_service (
    guest_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (guest_id, service_id),
    FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);

-- Создание таблицы staff
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    hotel_id INT NOT NULL,
    first_name VARCHAR2(255) NOT NULL,
    last_name VARCHAR2(255) NOT NULL,
    position VARCHAR2(255) NOT NULL,
    salary NUMBER(10,2) NOT NULL,
    service_id INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);

-- Добавление данных в таблицу hotel
INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (1, 'Hotel BMZ', 'Radiansk', 'SS 1', 4.5);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (2, 'Hotel MBZ', 'Simferopol', 'SS 2', 3.8);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (3, 'Hotel MBZ', 'Poltava', 'SS 3', 4.2);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (4, 'Hotel MBZ', 'Mykolaiv', 'SS 4', 3.9);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (5, 'Hotel MBZ', 'Kiiv', 'SS 5', 4.1);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (6, 'Hotel MBZ', 'Odessa', 'SS 6', 4.3);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (7, 'Hotel MBZ', 'Nova', 'SS 7', 3.7);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (8, 'Hotel MBZ', 'Donetsk', 'SS 8', 4.0);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (9, 'Hotel MBZ', 'Bratislava', 'SS 9', 4.4);

INSERT INTO hotel (hotel_id, name, city, address, star_rating)
VALUES (10, 'Hotel MBZ', 'Kosice', 'SS 10', 4.6);

-- Добавление данных в таблицу guest
INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (1, 'Иван', 'Иванов', 'ivan@example.com', '1234567890');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (2, 'Петр', 'Петров', 'peter@example.com', '9876543210');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (3, 'Мария', 'Сидорова', 'maria@example.com', '5551234567');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (4, 'Елена', 'Козлова', 'elena@example.com', '7779998888');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (5, 'Алексей', 'Николаев', 'alex@example.com', '2223334444');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (6, 'Ольга', 'Иванова', 'olga@example.com', '4445556666');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (7, 'Дмитрий', 'Смирнов', 'dmitry@example.com', '9990001111');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (8, 'Татьяна', 'Петрова', 'tatiana@example.com', '7778889999');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (9, 'Ирина', 'Кузнецова', 'irina@example.com', '1234567890');

INSERT INTO guest (guest_id, first_name, last_name, email, phone)
VALUES (10, 'Сергей', 'Федоров', 'sergey@example.com', '5556667777');

-- Добавление данных в таблицу room
INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (101, 1, 'Standard', 100, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (102, 1, 'Suite', 200, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (103, 2, 'Standard', 120, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (104, 2, 'Suite', 220, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (105, 3, 'Standard', 110, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (106, 3, 'Suite', 210, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (107, 4, 'Standard', 105, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (108, 4, 'Suite', 215, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (109, 5, 'Standard', 115, '0');

INSERT INTO room (room_number, hotel_id, type, price_per_night, availability)
VALUES (110, 5, 'Suite', 225, '0');
-- Добавление данных в таблицу service
INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (1, 1, 'Wi-Fi', 'High-speed internet access', 10);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (2, 1, 'Breakfast', 'Daily breakfast buffet', 20);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (3, 2, 'Parking', 'Secure parking area', 15);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (4, 2, 'Spa', 'Relaxing spa treatments', 50);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (5, 3, 'Fitness Center', 'Access to gym facilities', 30);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (6, 3, 'Room Service', 'In-room dining service', 25);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (7, 4, 'Laundry', 'Laundry and dry cleaning services', 20);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (8, 4, 'Concierge', 'Personalized concierge service', 30);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (9, 5, 'Airport Shuttle', 'Transportation to/from airport', 40);

INSERT INTO service (service_id, hotel_id, name, description, price)
VALUES (10, 5, 'Business Center', 'Access to business facilities', 25);

-- Добавление данных в таблицу reservation
INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (1, 1, 101, TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (2, 2, 102, TO_DATE('2024-04-18', 'YYYY-MM-DD'), TO_DATE('2024-04-22', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (3, 3, 103, TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (4, 4, 104, TO_DATE('2024-04-22', 'YYYY-MM-DD'), TO_DATE('2024-04-27', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (5, 5, 105, TO_DATE('2024-04-25', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (6, 6, 106, TO_DATE('2024-04-28', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (7, 7, 107, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (8, 8, 108, TO_DATE('2024-05-04', 'YYYY-MM-DD'), TO_DATE('2024-05-09', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (9, 9, 109, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TO_DATE('2024-05-12', 'YYYY-MM-DD'));

INSERT INTO reservation (reservation_id, guest_id, room_number, check_in_date, check_out_date)
VALUES (10, 10, 110, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'));

-- Добавление данных в таблицу staff
INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (1, 1, 'Иван', 'Иванов', 'Администратор', 3000, 1);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (2, 1, 'Петр', 'Петров', 'Повар', 2500, 2);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (3, 2, 'Марина', 'Сидорова', 'Уборщица', 2000, 3);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (4, 2, 'Алексей', 'Николаев', 'Рецепционист', 2800, 4);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (5, 3, 'Ольга', 'Иванова', 'Массажист', 3200, 5);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (6, 3, 'Дмитрий', 'Смирнов', 'Тренер по фитнесу', 2700, 6);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (7, 4, 'Татьяна', 'Петрова', 'Прачка', 2100, 7);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (8, 4, 'Ирина', 'Кузнецова', 'Консьерж', 3000, 8);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (9, 5, 'Сергей', 'Федоров', 'Водитель', 2500, 9);

INSERT INTO staff (staff_id, hotel_id, first_name, last_name, position, salary, service_id)
VALUES (10, 5, 'Елена', 'Сидорова', 'Администратор', 2800, 10);

-- Добавление данных в таблицу guest_service
INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (1, 1, 2);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (1, 2, 1);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (2, 3, 3);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (3, 1, 1);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (4, 2, 2);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (5, 3, 1);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (6, 1, 2);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (7, 2, 1);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (8, 3, 2);

INSERT INTO guest_service (guest_id, service_id, quantity)
VALUES (9, 1, 1);
