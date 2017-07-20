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

select count(*) from Flights
where (arr_time is not null) 
and (destination="ATL");

SELECT    state, 
    COUNT(CASE WHEN elevation < 1000 THEN 1 ELSE NULL END) as count_low_elevation_aiports 
FROM airports 
GROUP BY state;

select origin, sum(distance) as total_flight_distance, sum(case when carrier = "DL" then distance else 0 end) as total_delta_flight_distance
from flights
group by 1;


/* date and time */
select datetime(delivery_time) from baked_goods;

select DATE(delivery_time), count(*) as count_baked_goods
from baked_goods
group by DATE(delivery_time);

select delivery_time, datetime(delivery_time, "+5 hours", "20 minutes", "2 day") as package_time 
from baked_goods;

select ingredients_cost, round(ingredients_cost, 1) as rounded_cost
from baked_goods;

select city || ' '|| state as location from bakeries;


/* Analyzing Business Metrics */

select name, round(sum(amount_paid) / (select sum(amount_paid) from order_items) *100.0, 2) as pct 
/* inside the close = total of all rows, nominator = each row from order_items */
from order_items
group by 1
order by 2 desc;
