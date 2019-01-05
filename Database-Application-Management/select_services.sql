create or replace procedure select_services 
  (p_reservation_id IN amenities.reservation_id%type )
As
        cursor c1 is select * from amenities where reservation_id=p_reservation_id; 
begin
   for x in c1 loop
         if c1%NOTFOUND THEN
             dbms_output.put_line('there are no services for this reservation');
         END IF; 
dbms_output.put_line('reservation id :  '  || x.reservation_id  ||'  | No. of movies :   ' || x.num_movies || '   | No. of laundry : ' || x.num_laundry || '  | No. of meals : ' || x.num_meals ); 
   END LOOP;

EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 

end select_services; 
