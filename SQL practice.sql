select a.dep_month,
			 a.dep_day_of_week,
       AVG(a.flight_distance) as average_distance
from(
  select dep_month,
  			 dep_day_of_week,
  			 dep_date,
  			 sum(distance) as flight_distance
  from Flights
GROUP BY 1,2,3
) a
GROUP BY 1,2
ORDER BY 1,2;
