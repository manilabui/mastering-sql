-- Book 2, Chapter 11: CARNIVAL CUSTOMERS

-- What are the top 5 US states with the most customers who have purchased a vehicle from a dealership participating in the Carnival platform?
select
	d.state,
	count(s.customer_id) as num_of_customers
from sales s
	join dealerships d on s.dealership_id = d.dealership_id
where s.sales_type_id = 1
group by d.state
order by num_of_customers desc;

-- What are the top 5 US zipcodes with the most customers who have purchased a vehicle from a dealership participating in the Carnival platform?
select
	c.zipcode,
	count(s.customer_id) as num_of_customers
from sales s
	join customers c on s.customer_id = c.customer_id
where s.sales_type_id = 1
group by c.zipcode
order by num_of_customers desc;

-- What are the top 5 dealerships with the most customers?
select
	d.business_name,
	count(s.customer_id) as num_of_customers
from sales s
	join dealerships d on s.dealership_id = d.dealership_id
group by d.business_name
order by num_of_customers desc;