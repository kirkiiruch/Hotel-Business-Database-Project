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

-- Pohľad: Celková cena izieb v každom hoteli
CREATE VIEW view_hotel_room_prices AS
SELECT hotel_id, SUM(price_per_night) AS total_room_price -- Celková cena izieb je súčet cien na noc za všetky izby v danom hoteli
FROM room
GROUP BY hotel_id;

-- Pohľad: Dostupné izby
CREATE OR REPLACE VIEW view_available_rooms AS
SELECT room_number, type, price_per_night 
FROM room
WHERE availability = '1'; 

-- Pohľad: Informácie o rezervácii s menom hosťa a číslom izby
CREATE VIEW view_reservation_guest_infoo AS
-- Vytvorenie pohľadu s informáciami o rezervácii, menom hosťa a číslom izby
SELECT r.reservation_id, g.first_name, g.last_name, r.room_number, r.check_in_date, r.check_out_date
-- Výber stĺpcov z tabuliek rezervácií, hostí a izieb
FROM reservation r
JOIN guest g ON r.guest_id = g.guest_id
JOIN room rm ON r.room_number = rm.room_number;


-- Pohľad: Informácie o izbách s hosťom (vrátane nedostupných izieb)
CREATE VIEW view_rooms_with_guests AS
-- Vytvorenie pohľadu s informáciami o izbách a hosťoch (vrátane nedostupných izieb)
SELECT rm.room_number, rm.type, g.first_name, g.last_name, r.check_in_date, r.check_out_date
-- Výber stĺpcov z tabuliek izieb, rezervácií a hostí
FROM room rm
LEFT JOIN reservation r ON rm.room_number = r.room_number
LEFT JOIN guest g ON r.guest_id = g.guest_id;



-- Pohľad: Informácie o hostovi s jeho rezerváciami
CREATE VIEW view_guest_with_reservations AS
-- Vytvorenie pohľadu s informáciami o hostovi a jeho rezerváciách
SELECT g.guest_id, g.first_name, g.last_name, g.email, r.reservation_id, r.check_in_date, r.check_out_date
-- Výber stĺpcov z tabuliek hostí a rezervácií
FROM guest g
JOIN reservation r ON g.guest_id = r.guest_id;

-- Pohľad: Priemerná cena izieb v každom hoteli
CREATE VIEW view_avg_room_prices AS
-- Vytvorenie pohľadu s priemernou cenou izieb v každom hoteli
SELECT hotel_id, AVG(price_per_night) AS avg_room_price --Funkcia AVG() sa používa na výpočet priemernej hodnoty číselného stĺpca v SQL.
-- Výpočet priemernej ceny izieb pre každý hotel
FROM room
GROUP BY hotel_id;

-- Pohľad: Počet rezervácií pre každého hosťa
CREATE VIEW view_guest_reservation_count AS
-- Vytvorenie pohľadu s počtom rezervácií pre každého hosťa
SELECT guest_id, COUNT(*) AS reservation_count --COUNT(*) - je agregátová funkcia, ktorá vráti celkový počet riadkov v súbore údajov alebo výsledku požiadavky.
-- Počet rezervácií pre každého hosťa
FROM reservation
GROUP BY guest_id;

-- Pohľad: Zlúčenie dostupných štandardných a luxusných izieb
CREATE OR REPLACE VIEW view_available_roooms_union AS
-- Vytvorenie pohľadu s zlúčením dostupných štandardných a luxusných izieb
SELECT room_number, type, price_per_night
FROM room
WHERE availability = '1' AND type = 'Standard'
UNION -- Viacnásobná operácia UNION na spojenie výsledkov
SELECT room_number, type, price_per_night
FROM room
WHERE availability = '1' AND type = 'Suite';


-- Pohľad: Hosťovia, ktorí si rezervovali najdrahšie izby
CREATE VIEW view_guests_with_expensive_rooms AS
-- Vytvorenie pohľadu s informáciami o hosťoch, ktorí si rezervovali najdrahšie izby
SELECT g.guest_id, g.first_name, g.last_name, r.room_number, rm.type, rm.price_per_night
-- Výber údajov o hosťoch, rezerváciách a izbách
FROM guest g
JOIN reservation r ON g.guest_id = r.guest_id
JOIN room rm ON r.room_number = rm.room_number
-- Obmedzenie výsledkov iba na najdrahšie izby podľa ceny
WHERE rm.price_per_night = (SELECT MAX(price_per_night) FROM room);

-- Pohľad: Priemerná cena služieb v každom hoteli, okrem hotelov s nízkymi priemernými cenami
CREATE OR REPLACE VIEW view_avg_service_prices AS
SELECT s.hotel_id, AVG(s.price) AS avg_service_price
FROM service s
WHERE s.hotel_id IN (
    SELECT hotel_id
    FROM (
        SELECT hotel_id, AVG(price) AS avg_price
        FROM service
        GROUP BY hotel_id
        HAVING AVG(price) > (
            SELECT AVG(price)
            FROM service
        )
    )
)
GROUP BY s.hotel_id;




-- Vytvorenie postupnosti na generovanie primárnych kľúčov
CREATE SEQUENCE seq_reservation_id
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Vytvorenie spúšča pre automatické vkladanie hodnôt do tabuľky reservation
CREATE OR REPLACE TRIGGER trg_insert_reservation_id --Definovanie nového spúšťa s názvom trg_insert_reservation_id alebo nahradenie existujúceho spúšťa s rovnakým názvom, ak už existuje (OR REPLACE).
BEFORE INSERT ON reservation--Ukazuje, že spúšť sa má vykonať pred vložením (BEFORE INSERT) novej riadku do tabuľky reservation.
FOR EACH ROW--Určuje, že spúšť sa má vykonať pre každý riadok (FOR EACH ROW), ktorý spadá pod udalosť operátora (BEFORE INSERT ON reservation).
BEGIN
    SELECT seq_reservation_id.NEXTVAL--NEXTVAL - je funkcia, ktorá vráti nasledujúcu hodnotu z danej postupnosti.
    INTO :NEW.reservation_id
    FROM dual;
END;
/
-- Vytvorenie  spúšťa (s podmienkou)
CREATE OR REPLACE TRIGGER trg_check_room_availability
BEFORE INSERT OR UPDATE ON reservation
FOR EACH ROW
DECLARE
    room_status

 CHAR(1);
BEGIN
    -- Získanie stavu dostupnosti izby podľa čísla
    SELECT availability
    INTO room_status
    FROM room
    WHERE room_number = :NEW.room_number;

    -- Kontrola dostupnosti izby pred rezerváciou alebo aktualizáciou
    IF room_status = '0' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Izba nie je k dispozícii na rezerváciu.');
    END IF;
END;
/


-- Проверка таблицы hotel
SELECT * FROM hotel;

-- Проверка таблицы service
SELECT * FROM service;

-- Проверка таблицы guest
SELECT * FROM guest;

-- Проверка таблицы room
SELECT * FROM room;

-- Проверка таблицы reservation
SELECT * FROM reservation;

-- Проверка таблицы guest_service
SELECT * FROM guest_service;

-- Проверка таблицы staff
SELECT * FROM staff;

-- Проверка представления view_hotel_room_prices
SELECT * FROM view_hotel_room_prices;

-- Проверка представления view_available_rooms
SELECT * FROM view_available_rooms;

-- Проверка представления view_reservation_guest_info
SELECT * FROM view_reservation_guest_infoo;

-- Проверка представления view_rooms_with_guests
SELECT * FROM view_rooms_with_guests;

-- Проверка представления view_guest_with_reservations
SELECT * FROM view_guest_with_reservations;

-- Проверка представления view_avg_room_prices
SELECT * FROM view_avg_room_prices;

-- Проверка представления view_guest_reservation_count
SELECT * FROM view_guest_reservation_count;


-- Проверка представления view_available_rooms_union
SELECT * FROM view_available_roooms_union;


-- Проверка представления view_guests_with_expensive_rooms
SELECT * FROM view_guests_with_expensive_rooms;

-- Проверка представления view_avg_service_prices
SELECT *
FROM view_avg_service_prices;
