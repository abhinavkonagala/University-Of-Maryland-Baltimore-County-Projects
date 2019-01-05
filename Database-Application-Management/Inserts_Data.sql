-- Inserts into hotel
insert into hotel (hotel_id, hotel_name, hotel_address, hotel_address2, hotel_state, hotel_zip, hotel_city, hotel_phone, total_single_bedrooms, total_double_bedrooms, total_suite, total_conference_room) VALUES(1,'Hotel Blue','1234 Smith Ave.','PO Box 001','MD',21043,'Columbia','800-111-2222',25,20,27,23);

INSERT INTO hotel (hotel_id, hotel_name, hotel_address, hotel_address2, hotel_state, hotel_zip, hotel_city,  hotel_phone, total_single_bedrooms, total_double_bedrooms, total_suite, total_conference_room) VALUES (2,'Hotel Brown', '5555 Washington Rd.', 'PO Box 011', 'MD' , 21042, 'Mount Hebron', '800-222-1111', 28, 27, 29, 26);

INSERT INTO hotel (hotel_id, hotel_name, hotel_address, hotel_address2, hotel_state, hotel_zip, hotel_city, hotel_phone, total_single_bedrooms, total_double_bedrooms, total_suite, total_conference_room) VALUES (3,'Hotel Purple', '1222 York Ave..', 'PO Box 221', 'MD' , 21021, 'Catonsville', '800-333-1122', 25, 28, 22, 29);

INSERT INTO hotel (hotel_id, hotel_name, hotel_address, hotel_address2, hotel_state, hotel_zip, hotel_city, hotel_phone, total_single_bedrooms, total_double_bedrooms, total_suite, total_conference_room) VALUES (4,'Hotel Green', '1632 Michigan Ave.', 'PO Box 671', 'MD' , 21089, 'Baltimore', '800-451-2452', 27, 29, 22, 29);

INSERT INTO hotel (hotel_id, hotel_name, hotel_address, hotel_address2, hotel_state, hotel_zip, hotel_city, hotel_phone, total_single_bedrooms, total_double_bedrooms, total_suite, total_conference_room) VALUES (5,'Hotel Yellow', '1234 Alpha Rd.', 'PO Box 341', 'MD', 21033, 'Sykesville', '800-131-1298', 24, 25, 27, 23);

--Inserts for Room_Type 
 
insert into room_type (ROOM_TYPE_ID,type) values(1,'Single');
 
insert into room_type (ROOM_TYPE_ID,type) values(2,'Double');
 
insert into room_type (ROOM_TYPE_ID,type) values(3,'Suite');
 
insert into room_type (ROOM_TYPE_ID,type) values(4,'Conference');

--Inserts for ROOM
INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (1, 1, 1);
 
INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (2, 1, 3);

INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (3, 2, 3); 

INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (4, 2, 2); 

INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (5, 3, 1); 

INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (1, 3, 2); 

INSERT INTO Room (room_id, hotel_id, room_type_id) VALUES (2, 4, 1); 

--Inserts for Customer
INSERT INTO Customer(customer_id, customer_first_name, customer_last_name,  customer_phone, customer_address1, customer_address2, customer_city, customer_state, customer_zip, credit_card) VALUES(1,'Janet', 'Smith', '4431230921', '8045 Four Quarter Rd', 'null', 'Ellicott City', 'MD', 21043, '411111111111111');  

INSERT INTO Customer (customer_id, customer_first_name, customer_last_name, customer_phone, customer_address1,customer_address2, customer_city, customer_state, customer_zip, credit_card) VALUES(2, 'Lori', 'Don', '4431451256', '9143 Internet Ave', 'null', 'Columbia', 'MD', 21043, '4111111111111121' ); 

INSERT INTO Customer (customer_id, customer_first_name, customer_last_name, customer_phone, customer_address1,customer_address2, customer_city, customer_state, customer_zip, credit_card) VALUES (3, 'Jane', 'Doe', '443167078','4652 Three Dome Rd', 'null', 'Sterling City', 'MD', 21043, '4111111114511111' ); 

INSERT INTO Customer (customer_id, customer_first_name, customer_last_name, customer_phone, customer_address1, customer_address2, customer_city, customer_state, customer_zip, credit_card) VALUES (4, 'Mary', 'Poppins', '4431237822','2435 Academy Rd', 'null', 'Ellicott City', 'MD', 21041,'4111122178111111' ); 

INSERT INTO Customer (customer_id, customer_first_name, customer_last_name, customer_phone, customer_address1, customer_address2, customer_city, customer_state, customer_zip, credit_card) VALUES (5, 'Tony', 'Stark', '4433450312', '8245 Miami Rd', 'null', 'Gothem', 'MD', 21543, '1111112121111151' ); 

--Inserts for Reservations
--Janet1 3nights
INSERT INTO reservation (reservation_id, customer_id, hotel_id, room_id, room_type_id, check_in_date, check_out_date, reservation_date, num_of_rooms, amenities_id)
VALUES (10000, 1, 1, 2, 3, TIMESTAMP'2018-04-13 15:00:00', TIMESTAMP'2018-04-16 11:00:00', DATE '2018-04-13', 4,10);

--Lori2 4nights
INSERT INTO reservation (reservation_id, customer_id, hotel_id, room_id, room_type_id, check_in_date, check_out_date, reservation_date, num_of_rooms, amenities_id)
VALUES (10001, 2, 2, 1, 3, TIMESTAMP'2018-07-04 15:00:00', TIMESTAMP'2018-07-08 11:00:00', DATE '2018-07-04', 1, 11);

--Jane3 2nights
INSERT INTO reservation (reservation_id, customer_id, hotel_id, room_id, room_type_id, check_in_date, check_out_date, reservation_date, num_of_rooms, amenities_id)
VALUES (10002, 2, 4, 4, 1, TIMESTAMP'2018-08-12 15:00:00', TIMESTAMP'2018-08-14 11:00:00', DATE '2018-08-12', 1, 12);

--Mary4 4nights
INSERT INTO reservation (reservation_id, customer_id, hotel_id, room_id, room_type_id, check_in_date, check_out_date, reservation_date, num_of_rooms, amenities_id)
VALUES (10003, 4, 3, 5, 2, TIMESTAMP'2018-02-14 15:00:00', TIMESTAMP'2018-02-18 11:00:00', DATE '2018-02-14', 1, 13);

--Tony5 4nights
INSERT INTO reservation (reservation_id, customer_id, hotel_id, room_id, room_type_id, check_in_date, check_out_date, reservation_date, num_of_rooms, amenities_id)
VALUES (10004, 5, 3, 5, 2, TIMESTAMP'2018-02-14 15:00:00', TIMESTAMP'2018-02-18 11:00:00', DATE '2018-02-14', 1, 14);

--Inserts for Amenities
INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies, service_date) VALUES (10, 10000, 3, 0, 2, '14-APR-18');

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies, service_date) VALUES (11, 10001, 4, 1, 1, '05-JUL-18');

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies, service_date) VALUES (12, 10002, 2, 0, 0, '14-AUG-18');

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies, service_date) VALUES (13, 10003, 4, 2, 4, '15-FEB-18');

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies, service_date) VALUES (14, 10004, 4, 2, 4, '17-FEB-18');

--Inserts for Payment
--10000 3 nights. 600 + 2 movies + 3 meals = 670
INSERT INTO payment (payment_id, reservation_id, pay_amount) VALUES (001, 10000, 670);

-- 10001 4 nights. + 4 meals, 2 laundry, 1 movie = 1305
INSERT INTO payment (payment_id, reservation_id, pay_amount) VALUES (002, 10001, 1305);

--10002 2 nights. +  2 meals, 0 + 0 = 640
INSERT INTO payment (payment_id, reservation_id, pay_amount) VALUES (003, 10002, 640);

--10003 4 nights. + 4 meals + 2 laundry + 4 movies = 920
INSERT INTO payment (payment_id, reservation_id, pay_amount) VALUES (004, 10003, 920);

--10004 4 nights. + 4 meals + 2 laundry + 4 movies = 920
INSERT INTO payment (payment_id, reservation_id, pay_amount) VALUES (005, 10004, 920);

