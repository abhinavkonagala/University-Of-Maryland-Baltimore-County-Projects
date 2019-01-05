-- question 16
set serveroutput on;
exec add_service(&Amenities_ID, &Reservation_Id, &Number_Of_Meals, &Number_Of_Laundry, &Number_Of_Movies, &Service_date);

--question 17
--calls the procedure and asks user to input the reservation_id
set serveroutput on;
exec select_services(&Reservation_ID);

--question 18
/*calling the procedure services_hotel and asking the user to input the value for the services (1 = number of meals, 2 = number of laundry, 3 = number of movies)*/
set serveroutput on;
exec services_hotel(&Service);

--question 19
set serveroutput on;
exec ser_income_rpt(&hotel);
