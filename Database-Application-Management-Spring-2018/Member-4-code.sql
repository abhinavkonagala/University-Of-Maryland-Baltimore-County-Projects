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

1.	The services that are offered by all HGI hotels are the same. They include:
a.	Restaurant services (assume $20 per person per meal)
b.	Pay-per-view movies (assume $5 per movie)
c.	Laundry services (assume $10 per time – regardless of number of items)

--Inserts for Amenities
INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies)
VALUES (10, 10000, 3, 0, 2);

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies)
VALUES (11, 10001, 4, 1, 1);

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies)
VALUES (12, 10002, 2, 0, 0);

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies)
VALUES (13, 10003, 4, 2, 4);
INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies)
VALUES (14, 10004, 4, 2, 4);









16) 

Create or replace procedure add_service
  ( p_ amenities_id IN amenities.amenities_id        ,
    p_ reservation_id IN amenities.reservation_id    , 
    p_ num_meals IN amenities.num_meals            ,
    p_ num_laundry IN amenities.num_laundry        ,
    p_ num_movies IN amenities.num_movies
  )
As
BEGIN

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies)
VALUES (p_amenities_id, p_reservation_id, p_num_meals, p_num_laundry, p_num_movies);
COMMIT; 

EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 
End add_service; 


--calling the add_service through sqlplus

SET SERVEROUTPUT ON; 
ACCEPT p_amenities_id number PROMPT ‘Enter Amenities ID ‘; 
ACCEPT p_reservation_id number PROMPT ‘Enter reservation ID’; 
ACCEPT p_num_meals number PROMPT ‘Enter no. of meals ‘; 
ACCEPT p_num_laundry number PROMPT ‘Enter no. of laundry’; 
ACCEPT p_num_movies number PROMPT ‘Enter no. of movies ‘; 
ACCEPT p_yes char(1) PROMPT ‘Do you want to add service – Y-yes N-No : ‘ ;
If p_yes=’Y’ or p_yes=’y’ then
Exec add_service(:p_amenities_id, :p_reservation_id, :p_num_meals, :p_num_laundry, :p_num_movies)
End if; 


   























17)

Create or replace procedure select_services 
  (p_reservation_id IN amenities.reservation_id
  )
As
        cursor c1 is select * from amenities where reservation_id=p_reservation_id; 
begin
   for x in c1 loop
         if c1%NOTFOUND THEN
             dbms_output.put_line(‘there are no services for this reservation’);
         END IF; 
dbms_output.put_line(‘reservation id :  ’  || x.reservation_id  ||’  | No. of movies :   ‘ || x.num_movies || ‘   | No. of laundry : ‘ || x.num_laundry || ‘  | No. of meals : ‘ || x.num_meals ); 
   END LOOP

EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 

end select_services; 

--selecting the services through sqlplus 

SET SERVEROUTPUT ON;

ACCEPT p_reservation_id number PROMPT ‘Enter Reservation ID’; 
exec select_services(:p_reservation_id)



18)
Create or replace procedure service_report 
As

SET SERVEROUTPUT ON
ACCEPT v_service char(30) PROMPT ‘Enter service name ’; 
Declare
  	q char(30):=v_service; 
	services_row  services%rowtype; 
begin
select hotel_id,service into services_row 
from amenities ame,
reservations res 
where ame.<to fill the variable   >=q
and ame.reservation_id = res.reservation_id; 

if services_row%found then
----below to changed appropriately	 
dbms_output.put_line(‘reservation id :  ’  || services_row.reservation_id  ||’  | No. of movies :   ‘ || services_row.num_movies || ‘   | No. of laundry : ‘ || services_row.num_laundry || ‘  | No. of meals : ‘ || services_row.num_meals ); 
else
dbms_output.put_line(‘there are no services for this reservation’);
end if; 
EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 

end fetch_services; 

