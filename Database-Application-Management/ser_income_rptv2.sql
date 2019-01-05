
create or replace procedure ser_income_rpt 
  (p_hotel_id IN number )
As
cursor c1 is select r.hotel_id,h.hotel_name,r.reservation_id,a.num_meals,a.num_laundry,a.num_movies 
from amenities a,reservation r,hotel h
where h.hotel_id=p_hotel_id
and a.reservation_id=r.reservation_id
and r.hotel_id=h.hotel_id;
 
x c1%rowtype; 

m_meals number :=0;
m_laundry number :=0;
m_movies number :=0;
m_meals_amt number :=0;
m_laundry_amt number :=0;
m_movies_amt number :=0;
tot_amt number :=0;
m_hotel varchar2(50);

begin
select hotel_name into m_hotel from hotel where hotel_id=p_hotel_id;

 
         if NOT c1%ISOPEN THEN
             OPEN C1;
         END IF; 
fetch c1 into x; 

	if c1%ROWCOUNT = 0  THEN
		dbms_output.put_line('there are no services for this reservation');
        END IF; 
       

while c1%FOUND loop




dbms_output.put_line('reservation id :  '  || x.reservation_id  ||'  | No. of movies :   ' || x.num_movies || '   | No. of laundry : ' || x.num_laundry || '  | No. of meals : ' || x.num_meals ); 
 

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
 
dbms_output.put_line('Hotel Name            : ' ||  m_hotel );
dbms_output.put_line('Total No. of meals    : ' || m_meals || ' | Total No. of Laundry :' || m_laundry  || ' | Total No. of Movies : ' || m_movies);
dbms_output.put_line('Total Meals amount    : ' || m_meals_amt || ' | Total Laundry Amount :' || m_laundry_amt  || ' | Total Movies amount : ' || m_movies_amt);
dbms_output.put_line('Total amount for all services : ' || tot_amt );
 


EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 

end ser_income_rpt; 

exec ser_income_rpt(&hotel)
