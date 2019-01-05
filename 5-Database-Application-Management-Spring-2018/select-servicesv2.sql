/* creating a procedure select_services which displays all the services when a particular reservation_id is selected*/ 
create or replace procedure select_services
	(p_reservation_id IN amenities.reservation_id%type )
As

--	adding a cursor c1 to store information from amenities
cursor c1 is select * from amenities where
reservation_id=p_reservation_id;

Begin

/*cursor c1 is assigned to x in for loop. When c1 is not found, it'll display an error*/

for x in c1 loop
if c1%NOTFOUND THEN
dbms_output.put_line('There are no services for this
reservation');
END IF;
dbms_output.put_line('Reservation Id :	' || x.reservation_id	||'
| Number of Movies :	' || x.num_movies || '	| Number of Laundry :
' || x.num_laundry || '	| Number of Meals : ' || x.num_meals );
END LOOP;

EXCEPTION

When others then

Dbms_output.put_line(SQLERRM);

end select_services;

--calls the procedure and asks user to input the reservation_id
set serveroutput on
exec select_services(&Reservation_ID);