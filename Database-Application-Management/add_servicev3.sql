-- Author: Abhinav Konagala
-- creating a procedure add service
 
Create or replace procedure add_service

-- inputing the parameters into each column in amenities table

  ( p_amenities_id IN amenities.amenities_id%type,
    p_reservation_id IN amenities.reservation_id%type, 
    p_num_meals IN amenities.num_meals%type,
    p_num_laundry IN amenities.num_laundry%type,
    p_num_movies IN amenities.num_movies%type,
    p_service_date IN amenities.service_date%type
  )
As
BEGIN

INSERT INTO amenities (amenities_id, reservation_id, num_meals, num_laundry, num_movies, service_date)
VALUES (p_amenities_id, p_reservation_id, p_num_meals, p_num_laundry, p_num_movies, p_service_date);
COMMIT; 

-- outputs an error in case of an exception

EXCEPTION
When others then
Dbms_output.put_line(SQLERRM); 
End add_service; 

set serveroutput on
exec add_service(&Amenities_ID, &Reservation_Id, &Number_Of_Meals, &Number_Of_Laundry, &Number_Of_Movies, &Service_date)