/* Codeacademy Table transforamtion */

select a.dep_month,
	a.dep_day_of_week,
       AVG(a.flight_distance) as average_distance
from(
  select dep_month,
  			 dep_day_of_week,
  			 dep_date,
  			 sum(distance) as flight_distance
  from Flights
GROUP BY 1,2,3  /* this group 1,2,3 refer to the column # for each column from dep_month */
) a
GROUP BY 1,2
ORDER BY 1,2;

/* assigne a sequential number to id or whatever using inner query*/
select origin, id,
(select count(*)
from flights f
where f.id < flights.id
and f.origin=flights.origin) +1
as flight_sequence_number
from Flights
;
