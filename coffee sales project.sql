use music ;
 
 -- who is the senior most employee based on on the job title ?
 
 
 SELECT 
    *
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

-- which countries hve the most invoice ?

select * from invoice ;

select count(*) as c , billing_country
from invoice 
group by billing_country
order by c desc ;

-- what are top 3 values of total invoice 

select total from invoice 
order by total desc 
limit 3 ;


-- /* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals */ ;

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc ;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

SELECT 
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    SUM(invoice.total) AS total
FROM
    customers
        JOIN
    invoice ON customers.customer_id = invoice.invoice_id
GROUP BY customers.customer_id , customers.first_name , customers.last_name
ORDER BY total DESC
LIMIT 1
;



/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

select distinct customers.email,customers.first_name,customers.last_name
from customers
join invoice on customers.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (select track_id from track
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock') order by email ;








    
    






