create table author(
	a_id int,
	a_first_name varchar(30),
	a_last_name varchar(30),
	Primary key (a_id)
	);
	
-- author 1 -5

insert into author values (1, 'Patrick', 'Lencioni');
insert into author values (2, 'J.R.R', 'Tolkien');
insert into author values (3, 'Yahtzee', 'Croshaw');
insert into author values (4, 'J.K', 'Rowling');
insert into author values (5, 'G.R.R', 'Martin');



create table genre (
	g_id int,
	g_nameOfGenre varchar(30),
	primary key (g_id)
	);
	
-- genre 1 - 2

insert into genre values (1, 'Non - Fiction');
insert into genre values (2, 'Fiction');


create table books(
	b_ISBN varchar (30), 
	b_title varchar(50),
	b_price int,
	b_year date,
	b_stock int,
	a_id int,
	g_id int,
	primary key (b_ISBN),
	foreign key (a_id) references author(a_id),
	foreign key (g_id) references genre(g_id)
	);
	
-- books 1 - 8

insert into books values ('0553103547', 'A Game Of Thrones', 20, date '1996-8-1', 10, 5, 1);
insert into books values ('0553108034', 'A Clash Of Kings', 20, date '1998-11-16', 10 , 5, 1);
insert into books values ('9780787995317', 'The Three Signs of a Miserable Job', 20, date '2007-8-1', 10, 1, 1);
insert into books values ('0439708184', 'Harry Potter and the Sorcerers stone' , 9, date  '1997-6-26', 10, 4, 2);
Insert into books values ('9781595829573', 'Jam', 10, date '2012-10-23', 5, 3, 2);
insert into books values ('9780345325818', 'Silmarillion', 8, date '1977-9-15', 7, 2, 2);
insert into books values ('9780547928210', 'The Fellowship of the Ring', 10, date '1954-6-29', 10, 2, 2);
insert into books values ('0345339711', 'The Two Towers', 10, date '1954-11-11', 10, 2, 2); 


create table credit_card (
	cred_id int,
	cred_type varchar (20),
	cred_card_number varchar (50),
	cred_card_expiration date,
	cred_cvp int,
	cred_first_name varchar (20),
	cred_last_name varchar (20),
	primary key (cred_id)
	);
	
-- credit_card 1 - 7
	
insert into credit_card values (1, 'Visa', '4556 8448 4081 0460', date '2019-04-01', 784, 'HAILEY', 'COLEMAN');
insert into credit_card values (2, 'Visa', '4929 9367 0573 4536', date '2018-09-01', 902, 'ELLA', 'NEVILL');
insert into credit_card values (3, 'Mastercard', '5220 0825 9294 9672', date '2018-06-01', 738, 'LOGAN', 'KINGSMAN');
insert into credit_card values (4, 'American Express', '3480 570864 72959', date '2018-11-01', 700, 'XAVIER', 'DEAN');
insert into credit_card values (5, 'Visa', '4024 0071 6329 3938', date '2019-10-01', 145, 'CHASE', 'ARCHIBALD');
insert into credit_card values (6, 'Visa', '4716 8654 7903 9383', date '2018-01-01', 124, 'RICHARD', 'BOSWORTH');
insert into credit_card values (7, 'Mastercard', '5529 9340 5223 6727', date '2018-07-01', 350, 'LILY', 'FREEMAN');


create table paypal (
	pal_id int,
	primary key (pal_id)
	);
	
-- paypal 1 - 3

insert into paypal values(1);
insert into paypal values(2);
insert into paypal values(3);


create table payment(
	p_id int,
	cred_id int,
	pal_id int,
	primary key (p_id),
	foreign key (cred_id) references credit_card (cred_id),
	foreign key (pal_id) references paypal (pal_id)
	);
	
-- payment 1 - 10
	
insert into payment values (1, 2, null);
insert into payment values (2, null, 2);
insert into payment values (3, null, 1);
insert into payment values (4, 1, null);
insert into payment values (5, 3, null);
insert into payment values (6, 4, null);
insert into payment values (7, null, 3);
insert into payment values (8, 5, null);
insert into payment values (9, 7, null);
insert into payment values (10, 6, null);

	
create table customer (
	c_id int,
	p_id int,
	c_first_name varchar(30),
	c_last_name varchar(30),
	c_email varchar(30),
	c_street varchar (50),
	c_city varchar (30),
	c_state varchar (30),
	c_zip int,
	primary key (c_id),
	foreign key (p_id) references payment (p_id)
	);

-- customer 1 - 10 (7 credit card and 3 paypal)
	
	
insert into customer values (1, 2, 'HAILEY', 'COLEMAN', 'hailey@coleman.com', '123 6th St', 'Melbourne', 'FL', 32904);
insert into customer values (2, 1, 'ELLA', 'NEVILL', 'ella@nevill.com', '71 Pilgrim Avenue', 'Chevy Chase', 'MD', 20815);
insert into customer values (3, 4, 'LOGAN', 'KINGSMAN', 'logan@kingsman.com', '70 Bowman St', 'South Windsor', 'CT', 96074);
insert into customer values (4, 3, 'XAVIER', 'DEAN', 'xavier@dean.com', '4 Goldfield Rd', 'Honolulu', 'HI', 96815);
insert into customer values (5, 6, 'CHASE', 'ARCHIBALD', 'chase@archibald.com', '44 Shirley Ave', 'West Chicago', 'IL', 60185);
insert into customer values (6, 5, 'RICHARD', 'BOSWORTH', 'richard@bosworth.com', '514 S. Magnolia St', 'Orlando', 'FL', 32806);
insert into customer values (7, 10, 'LILY','FREEMAN', 'lily@freeman.com', '760 Sunbeam Lane', 'Arlington Heights', 'IL', 60004);
insert into customer values (8, 9, 'SARAH', 'HAWKINS', 'sarah@hawkins.com', '514 S. Magnolia St', 'Orlando', 'FL', 32806);
insert into customer values (9, 7, 'JACK', 'WARD', 'jack@ward.com', '7754 Mill Pond St', 'Monroe Township', 'NJ', 98831);
insert into customer values (10, 8, 'JULIAN', 'HOWARD', 'julian@howard.com', '7211 Homewood Ave', 'Huntersville', 'NC', 28078);


create table orders (
	o_id int,
	c_id int,
	b_ISBN varchar (30),
	o_total_price int,
	o_num_of_items int,
	o_shipping_type varchar(30),
	primary key (o_id),
	foreign key (c_id) references customer (c_id),
	foreign key (b_ISBN) references books (b_ISBN)
	);
	
-- orders 1 - 10
	
insert into orders values (1, 3, '0439708184', 15, 1, 'Express');
insert into orders values (2, 1, '0553103547', 25, 1, 'Express');
insert into orders values (3, 4, '0439708184', 12, 1, 'Standard');
insert into orders values (4, 5, '9780547928210', 16, 1, 'Express');
insert into orders values (5, 2, '9780787995317', 22, 1, 'Standard');
insert into orders values (6, 6, '0553108034', 25, 2, 'Express');
insert into orders values (7, 3, '9781595829573', 10, 1, 'Express');
insert into orders values (8, 9, '0345339711', 10,1, 'Standard');
insert into orders values (9, 8, '0553108034', 20, 1, 'Standard');
insert into orders values (10, 7, '0553108034', 25,1, 'Express');



-- SQL QUERIES

	
-- select queries

select b_title from books where b_year < date '1998-11-16';

select b_title from books where b_price > 10 and b_stock > 5;

select * from books where b_price > 10 and b_stock > 5;

select b_title from books where b_stock <= 5;

select c_first_name from customer where c_first_name like 'J%';

-- update queries

update orders set o_total_price =  25, o_num_of_items =  2, o_shipping_type = 'Express'
	where o_id = 1;
	
update books
	set b_stock = b_stock - 1 
	Where b_ISBN = 9781595829573;

-- join

select c_first_name, b_title, o_id from customer, books, orders 
	where customer.c_id = orders.c_id and books.b_isbn = orders.b_isbn;
	
select a_first_name, a_last_name, b_title, g_nameofgenre from author, books, genre
	where author.a_id = books.a_id and books.g_id = genre.g_id;
	
select c_first_name, c_last, o_shipping_type from customer, orders 
	where customer.c_id = orders.c_id;
	
Select b_title, o_id from books, orders where books.b_ISBN = orders.b_ISBN and o_id = 1;


-- group by

select a_id from books group by a_id having count(*) >=2 

select a_id, count(*) from books where b_year > date '1998-11-16' group by a_id having count(*) >= 1

select count(b_title), b_price from books group by b_price;







	
