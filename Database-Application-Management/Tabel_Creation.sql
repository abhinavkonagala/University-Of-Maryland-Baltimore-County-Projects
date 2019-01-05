-- Create hotel table
CREATE TABLE hotel(

hotel_id integer NOT NULL,
hotel_name varchar(50),
hotel_address varchar(50),
hotel_address2 varchar(30),
hotel_state varchar(2),
hotel_zip integer,
hotel_city varchar(30), 
hotel_phone varchar(12),
total_single_bedrooms integer,
total_double_bedrooms integer,
total_suite integer,
total_conference_room integer,
PRIMARY KEY (hotel_id)
);


--Create Room_types table
create table room_type(
  room_type_id integer not null,
  Type varchar(20),
  primary key (room_type_id)
);


--Create Room table
create table room(
  room_id integer not null,
  hotel_id integer,
  room_type_id integer,
  primary key (room_id),
  foreign key (hotel_id) references hotel(hotel_id),
  foreign key (room_type_id) references room_type(room_type_id)
);


--Create Customer table
create table customer(
  customer_id integer not null,
  customer_first_name varchar(20),
  customer_last_name varchar(20),
  customer_phone varchar(20),
  customer_address1 varchar(50),
  customer_address2 varchar(30),
  customer_city varchar(30),
  customer_state varchar(2),
  customer_zip number,
  Credit_card varchar(16),
  primary key (customer_id)
);


--Create Reservation table
  create table reservation(
  reservation_id integer not null,
  customer_id integer,
  hotel_id integer,
  room_id integer,
  room_type_id integer,
  check_in_date timestamp,
  check_out_date timestamp,
  reservation_date date,
  num_of_rooms integer,
  primary key (reservation_id),
  foreign key (customer_id) references customer(customer_id),
  foreign key (hotel_id) references hotel(hotel_id),
  foreign key (room_id) references room(room_id),
  foreign key (room_type_id) references room_type(room_type_id)
);
--This is to add amenities_id to the reservation table. This is different from the drive document. Dad edited this.
alter table reservation add amenities_id integer;
alter table reservation add foreign key (amenities_id) references amenities(amenities_id); --disabled the fk, removed constraint

--if an error comes
alter table reservation disable constraint SYS_C00496081;


--Create Amenities table
create table Amenities(
amenities_id integer not null,
reservation_id integer,
num_meals integer,
num_laundry integer,
num_movies integer,
primary key (amenities_id),
foreign key (reservation_id) references reservation(reservation_id)
);

alter table amenities add service_date date;


--Create Payment table
create table payment(
payment_id integer not null,
reservation_id integer,
pay_amount integer,
primary key (payment_id),
foreign key (reservation_id) references reservation(reservation_id)
);

