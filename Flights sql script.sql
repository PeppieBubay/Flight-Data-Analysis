create database Flights;
CREATE TABLE flight (
	flight_id INT PRIMARY KEY,
    actual_arrival_time VARCHAR(20),
    actual_flight_time INT(20),
    actual_departure_time VARCHAR(20),
    air_time INT(20),
    air_traffic_delay INT(20),
    airline_code VARCHAR(10),
    airline_name VARCHAR(100),
    arrival_delay INT(20),
    cancellation_reason VARCHAR(100),
    carrier_delay INT(20),
    day DATE,
    departure_delay INT(20),
    destination_airport VARCHAR(10),
    destination_city VARCHAR(100),
    destination_state VARCHAR(20),
    distance FLOAT,
    flight_number VARCHAR(20),
    late_aircraft_delay INT(20),
    origin_airport VARCHAR(10),
    origin_city VARCHAR(100),
    origin_state VARCHAR(20),
    scheduled_arrival_time VARCHAR(20),
    scheduled_departure_time VARCHAR(20),
    scheduled_flight_time INT(20),
    security_delay INT(20),
    was_cancelled BOOLEAN,
    weather_delay INT(20),
    wheels_off_time VARCHAR(20),
    wheels_on_time VARCHAR(20),
    day_of_week VARCHAR(20)
);

#1. Show the flights where the origin city was New York
select *
from flights
where origin_city = 'New York'
limit 10;

#2. Which flights happened on other days of the week except Sunday?
select *
from flights
where day_of_week != 'Sunday';

#3. show flights with a distance of over 2000km
select *
from flights
where distance > 2000;

#4. Which flights have their flight numbers between 2500 to 3000?
select *
from flights
where flight_number between '2500' and '3000'
order by flight_number;

#5.What are the names of the airlines in the data set?
select distinct airline_name as airline_names
from flights;

#6.How many airlines area in the data set?
select count(distinct airline_name) as count_of_airline
from flights;

#7. What other destination cities did the airline named "Hawaiian Airlines Inc." have flights to aside from Pago Pago?
select *
from flights
where airline_name = 'Hawaiian Airlines Inc.' and destination_city != 'Pago Pago';

#8. How many flights were made to the destination city of Pago Pago?
select count(destination_city)
from flights
where destination_city = 'Pago Pago';

#9. What is the average distance of all flights?
select avg(distance)
from flights;

#10. How many cities does the airlines cover?
select count(distinct  destination_city)
from flights;

#11. How many states does the airlines cover?
select count(distinct  destination_state)
from flights;

#12. Get all flights where the day of the week was neither Saturday nor Sunday.Sort by airline name in descending order.
select *
from flights
where day_of_week <> 'Saturday' and day_of_week <> 'Sunday'
order by airline_name desc ;

#13.Get all flights where the day of the week was neither Saturday nor Sunday.Sort by airline name in descending order and day of the week.
select airline_name,day_of_week
from flights
where day_of_week <> 'Saturday' and day_of_week <> 'Sunday'
order by airline_name desc,day_of_week;

#14 Get all the first 10 flights and their total delays.
select flight_number,airline_name,air_traffic_delay + arrival_delay + carrier_delay + departure_delay + late_aircraft_delay + security_delay + weather_delay as total_delay
from flights
order by "day"
limit 10;


#15. How many flights were cancelled?
select count(was_cancelled) as Flights_count
from flights
where was_cancelled = "TRUE";

#16. What is the sum of the distance that was travelled by Delta Air Lines Inc. flights?
select sum(distance) as distance_travelled
from flights
where airline_name = "Delta Air Lines Inc.";

#17. What is the sum of the distance that was travelled by Envoy Air flights?
select sum(distance) as distance_travelled
from flights
where airline_name = "Envoy Air";

#18. What is the average distance per successful flight for the Envoy Air airline?
select sum(distance)/count(distance) as avg_flight_distance
from flights
where airline_name = "Envoy Air" and was_cancelled = "FALSE";

#19. What is the minimum and maximum distance travelled across all flights?
select min(distance) as minimum_distance,max(distance) as maximum_distance
from flights;

#20. Get the earliest and latest day Hawaiian Airlines Inc. had a flight in December 2018.
select min(day) as earliest_day,max(day) as latest_day
from flights
where airline_name = "Hawaiian Airlines Inc.";

#21. Get all flights that have a total distance that is greater than 5000.
select airline_name,destination_city,sum(distance) as total_distance
from flights
group by airline_name, destination_city
having sum(distance) > 5000
order by total_distance;

