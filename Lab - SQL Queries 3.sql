use sakila;

-- Instructions

-- 1. How many distinct (different) actors' last names are there?
select * from actor;
select count(distinct last_name) from actor;


-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from film;
select count(distinct language_id) from film;


-- 3. How many movies were released with "PG-13" rating?
select * from film;
select count(title) from film where rating = "PG-13";


-- 4. Get 10 the longest movies from 2006.
select * from film;
select * from film where release_year >= "2006" order by length desc limit 10;


-- 5. How many days has been the company operating (check DATEDIFF() function)?
select * from rental;
select min(substring(rental_date, 1, 10)) from rental; -- This is the first time they rent a movie
select max(substring(last_update, 1, 10)) from rental; -- This is the last information we have about the company

select datediff(day, '2005/05/24', '2006/02/23'); -- This should give us the difference but it doesn't work

-- 6. Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *, dayname(rental_date) as weekday, monthname(rental_date) as month from rental limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case
when dayname(rental_date) = "Saturday" then "weekend"
when dayname(rental_date) = "Sunday" then "weekend"
else "workday"
end as "day_type"
from rental;

-- 8. How many rentals were in the last month of activity?
select * from rental; -- We know by the exercice 5 that the last activity was at 2006-02-23
select count(rental_date) from rental where rental_date >= "2006-01-23";


