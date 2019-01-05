/*creating a procedure service_hotel to display all the information on all the services that each hotel has*/ create or replace procedure services_hotel
(p_service	IN number )
As

/*adding a cursor c1 to store information about num_meals from amenities and joining reservation_id from reservation table and amenities table*/
cursor c1 is select
r.hotel_id,h.hotel_name,r.reservation_id,a.num_meals
from amenities a,reservation r,hotel h
where a.num_meals>0
and a.reservation_id=r.reservation_id
and r.hotel_id=h.hotel_id order by r.hotel_id;


/*adding a cursor c2 to store information about num_laundry from amenities and joining reservation_id from reservation table and amenities table*/
cursor c2 is select
r.hotel_id,h.hotel_name,r.reservation_id,a.num_laundry
from amenities a,reservation r,hotel h
where a.num_laundry>0
and a.reservation_id=r.reservation_id
and r.hotel_id=h.hotel_id order by r.hotel_id;


/*adding a cursor c3 to store information about num_movies from amenities and joining reservation_id from reservation table and amenities table*/
cursor c3 is select
r.hotel_id,h.hotel_name,r.reservation_id,a.num_movies from amenities a,reservation r,hotel h
 
where a.num_movies>0
and a.reservation_id=r.reservation_id
and r.hotel_id=h.hotel_id order by r.hotel_id;


begin

/*asks user input. If 1, it will display the number of meals service in all the hotels*/

if p_service=1 then

for x in c1 loop
if c1%NOTFOUND THEN
dbms_output.put_line('There are no services for this
reservation');
END IF;
dbms_output.put_line('Hotel Id: ' || x.hotel_id || ' Hotel Name :' ||
x.hotel_name || ' Reservation Id :	' || x.reservation_id	|| ' |
Number of meals : ' ||

x.num_meals );

END LOOP;

/*asks user input. If 2, it will display the number of laundry service in all the hotels*/

elsif p_service=2 then

for y in c2 loop

if c2%NOTFOUND THEN
dbms_output.put_line('There are no services for this reservation');
END IF;
dbms_output.put_line('Hotel Id: ' || y.hotel_id || ' Hotel Name :' ||
y.hotel_name || ' Reservation Id :	' || y.reservation_id	|| ' |
Number of laundry : ' ||

y.num_laundry );

END LOOP;
 


/*asks user input. If 3, it will display the number of movies service in all the hotels*/

elsif p_service=3 then

for z in c3 loop

if c3%NOTFOUND THEN
dbms_output.put_line('There are no services for this reservation');
END IF;
dbms_output.put_line('Hotel Id: ' || z.hotel_id || ' Hotel Name :' ||
z.hotel_name || ' Reservation id :	' || z.reservation_id	|| ' |
Number of movies :	'

||	z.num_movies );
END LOOP;

else

dbms_output.put_line('There is no such service'); end if;

EXCEPTION

When others then

Dbms_output.put_line(SQLERRM);

/*calling the procedure services_hotel and asking the user to input the value for the services (1 = number of meals, 2 = number of laundry, 3 = number of movies)*/
set serveroutput on
exec services_hotel(&Service)


