create or replace procedure ser_income_rpt 
  (p_hotel_id IN number )
As
cursor c1 is select r.hotel_id,h.hotel_name,r.reservation_id,a.num_meals,a.num_laundry,a.num_movies 
from amenities a,reservation r,hotel h
where h.hotel_id=p_hotel_id
and a.reservation_id=r.reservation_id
and r.hotel_id=h.hotel_id;


 
m_meals number :=0;
m_laundry number :=0;
m_movies number :=0;
m_meals_amt number :=0;
m_laundry_amt number :=0;
m_movies_amt number :=0;
tot_amt number :=0;
m_hotel varchar2(50); 

select hotel_name into m_hotel from hotel
where hotel_id = p_hotel_id;

begin
   for x in c1 loop
         if c1%NOTFOUND THEN
             dbms_output.put_line('there are no services for this reservation');
         END IF; 
dbms_output.put_line('reservation id :  '  || x.reservation_id  ||'  | No. of movies :   ' || x.num_movies || '   | No. of laundry : ' || x.num_laundry || '  | No. of meals : ' || x.num_meals );

m_meals:=m_meals+x.num_meals;
m_laundry:=m_laundry+x.num_laundry;
m_movies:=m_movies+x.num_movies;
m_meals_amt:=m_meals*20;
m_laundry_amt := m_laundry *10;
m_movies_amt := m_movies * 5;
tot_amt := m_meals_amt + m_laundry_amt + m_movies_amt;
m_hotel :=x.hotel_name;


   END LOOP;
 

dbms_output.put_line('Total Meals amount : ' || m_meals_amt || ' | Total Laundry Amount :' || m_laundry_amt  || ' | Total Movies amount : ' ||  m_movies_amt);
dbms_output.put_line('Total services amount : ' || tot_amt || ' for ' ||  m_hotel );
 


EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 

end ser_income_rpt; 