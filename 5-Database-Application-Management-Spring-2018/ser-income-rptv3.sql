-- creating a procedure service income report

create or replace procedure ser_income_rpt 
  (p_hotel_id IN number ) --inputing the hotel_id
  
As
-- adding an explicit cursor c1 and joining 3 tables (hotel, reservation, and amenities)

cursor c1 is select r.hotel_id, h.hotel_name, r.reservation_id, a.num_meals, a.num_laundry, a.num_movies 
from amenities a, reservation r, hotel h
where h.hotel_id = p_hotel_id
and a.reservation_id = r.reservation_id
and r.hotel_id = h.hotel_id;

-- placing c1 in x

x c1%rowtype; 

-- declaring variables 

m_meals number := 0;
m_laundry number := 0;
m_movies number := 0;
m_meals_amt number := 0;
m_laundry_amt number := 0;
m_movies_amt number := 0;
tot_amt number := 0;
m_hotel varchar2(50);

begin

-- selecting hotel_name into m_hotel

select hotel_name into m_hotel from hotel where hotel_id = p_hotel_id;

-- if the cursor c1 is not open, we are asking it to open the c1 and fetch c1 in to x

         if NOT c1%ISOPEN THEN
             OPEN C1;
         END IF; 
         
fetch c1 into x; 

-- using %rowcount to see if there are any reservations in a hotel. If there are 0 reservations, it will print out the output: 'There are no services for this reservation'

	if c1%ROWCOUNT = 0  THEN
		dbms_output.put_line('There are NO services for this reservation!');
        dbms_output.put_line('----------------------------------------------------------------------------------------');
        END IF; 

--if c1 is found, it would display all the information about the hotel like reservation id, number of meals, number of laundry and number of movies
       
while c1%FOUND loop

dbms_output.put_line('Reservation ID     : '  || x.reservation_id  || chr(10) || 'Number of Meals    : ' || x.num_meals || chr(10) || 'Number of Laundry  : ' || x.num_laundry || chr(10) || 'Number of Movies   : ' || x.num_movies); 
dbms_output.put_line('--------------------------------------------------------------------------------------------------');

--performing calculations and storing each value in the respective variable

m_meals:=m_meals+x.num_meals;
m_laundry:=m_laundry+x.num_laundry;
m_movies:=m_movies+x.num_movies;
m_meals_amt:=m_meals*20;
m_laundry_amt := m_laundry *10;
m_movies_amt := m_movies * 5;
tot_amt := m_meals_amt + m_laundry_amt + m_movies_amt;
m_hotel :=x.hotel_name;

fetch c1 into x;

   END LOOP;
 
dbms_output.put_line('Hotel Name : ' ||  m_hotel );
dbms_output.put_line(' ');
dbms_output.put_line('Total Number of Meals : ' || m_meals  || '  || Total Number of Laundry : ' || m_laundry   || '  || Total Number of Movies : ' || m_movies);
dbms_output.put_line(' ');
dbms_output.put_line('Total Meals Amount    : ' || m_meals_amt  || ' || Total Laundry Amount    : ' || m_laundry_amt   || ' || Total Movies Amount    : ' || m_movies_amt);
dbms_output.put_line(' ');
dbms_output.put_line('Total Amount for all the services : ' || tot_amt );

-- prints out an error when there is an exception

EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 

end ser_income_rpt; 

set serveroutput on
exec ser_income_rpt(&hotel)

