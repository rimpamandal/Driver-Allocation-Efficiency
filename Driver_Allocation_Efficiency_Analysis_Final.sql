use ola_cabs;

alter table bookings
modify date date;

alter table bookings
modify time time;

alter table bookings
modify confirmed_at_date date;

alter table bookings
modify confirmed_at_time time;

#create a new column weekday/weekend

alter table bookings
add column day_type varchar(10);

update bookings
set day_type = case when dayofweek(pickup_date) between 2 and 6 then "Weekday"
else "Weekend"
end;

set SQL_safe_updates = 0;

# Identify Peak Demand Areas

with area_demand as(
select pickup_area, count(booking_id) as total_bookings
from bookings
group by pickup_area)
select l.area, ad.total_bookings
from area_demand ad join localities l on ad.pickup_area = l.area
order by ad.total_bookings desc
limit 10; 

# Driver Allocation Efficiency

with area_demand as(
select pickup_area, 
count(booking_id) as total_bookings
from bookings
group by pickup_area),

driver_allocation as (
select pickup_area, 
count(driver_number) as total_drivers
from bookings
group by pickup_area)

select l.area, ad.total_bookings, da.total_drivers,
(ad.total_bookings/nullif(da.total_drivers,0)) as booking_per_driver
from area_demand ad inner join driver_allocation da on ad.pickup_area = da.pickup_area
inner join localities l on ad.pickup_area = l.area
group by l.area,ad.total_bookings, da.total_drivers
order by ad.total_bookings desc
limit 20;

# Service status analysis

select service_status,
count(booking_id) as total_bookings,
concat(format(count(booking_id)*100.0 / sum(count(booking_id)) over(), 1),"%") as percentage_of_total
from bookings 
group by service_status
order by total_bookings desc;

/*area wise cancellation and completion rate analysis*/

WITH BookingCounts AS (
    SELECT pickup_area, COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY pickup_area
),
ServiceCounts AS (
    SELECT pickup_area,
           COUNT(CASE WHEN service_status = 'done' THEN 1 END) AS total_done,
           COUNT(CASE WHEN service_status = 'cancelled' THEN 1 END) AS total_cancelled
    FROM bookings
    GROUP BY pickup_area
)
SELECT b1.pickup_area,
       b1.total_bookings,
       CONCAT(FORMAT((COALESCE(b2.total_cancelled, 0) / b1.total_bookings) * 100, 1)," %") AS cancellation_rate,
       CONCAT(FORMAT((COALESCE(b2.total_done, 0) / b1.total_bookings) * 100, 1)," %") AS completion_rate
FROM BookingCounts b1
LEFT JOIN ServiceCounts b2
ON b1.pickup_area = b2.pickup_area
ORDER BY b1.total_bookings DESC
LIMIT 20;

# Booking time analysis

with hourly_bookings as(
select extract(hour from pickup_time) as booking_hour,
count(booking_id) as total_bookings
from bookings
group by extract(hour from pickup_time)),

Formatted_hours as (select case 
when booking_hour = 0 then "12 AM"
when booking_hour <12 then concat(booking_hour," AM")
when booking_hour = 12 then "12 PM"
else concat(booking_hour-12," PM")
end as booking_hour, 
total_bookings,
case when booking_hour = 0 then 24
when booking_hour <12 then booking_hour
else + 12 
end as sort_order
from hourly_bookings)

select booking_hour, total_bookings
from formatted_hours
order by sort_order;

# Revenue Analysis

with area_revenue as (
select pickup_area,
sum(fare) as total_revenue
from bookings
group by pickup_area)

select l.area, ar.total_revenue
from area_revenue ar right join localities l on ar.pickup_area = l.area
order by ar.total_revenue desc;

# Preffered Booking_Type & Booking_Mode

select booking_type, booking_mode, count(*)
from bookings
group by booking_type, booking_mode;


# Number of Trips by Each Driver
#analyze the number of trips completed by each driver to identify the most and least active drivers.

SELECT driver_number, day_type, COUNT(booking_id) AS total_trips
FROM bookings
GROUP BY driver_number, day_type
having driver_number is not null
ORDER BY total_trips DESC
LIMIT 10;

#booking trends over time to understand seasonal variations and patterns. 

select dayname(pickup_date) as weekday_name, 
count(booking_id) as total_bookings
from bookings
group by weekday_name
order by field(weekday_name,"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday");

# Percentage of Total by Day_Type

select day_type, count(booking_id) as total_bookings,
concat(format(count(booking_id)*100.0 / sum(count(booking_id)) over(), 0),"%") as percentage_of_total
from bookings
group by day_type;

# Customer Bookings at a time 

with Time_Interval as (
select a.pickup_area, a.pickup_time as start_time, 
		count(*) as Simultaneous_Bookings
from bookings a join bookings b on a.pickup_area = b.pickup_area 
and a.booking_id <> b.booking_id
and a.pickup_time = b.pickup_time
group by a.pickup_area, a.pickup_time )

select pickup_area,
max(Simultaneous_bookings) as Max_Simultaneous_Bookings
from Time_Interval
group by pickup_area
order by Max_Simultaneous_Bookings desc
limit 10;



