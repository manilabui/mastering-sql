-- Book 2, Chapter 8: CARNIVAL SALES (join + filter practices)

-- Write a query that shows the total purchase sales income per dealership.
select business_name, sum(s.price)
from sales s
join dealerships d on s.dealership_id = d.dealership_id
where sales_type_id = 1
group by business_name, d.dealership_id
order by d.dealership_id;

--OR--

select sum(s.price)
from sales s
join salestypes st on s.sales_type_id = st.sales_type_id
where st.name = 'Purchase';

-- Write a query that shows the purchase sales income per dealership for the current month.
select d.business_name, sum(s.price), s.purchase_date
from sales s
join dealerships d on s.dealership_id = d.dealership_id
where sales_type_id = 1
	and extract(month from purchase_date) = extract(month from current_date)
group by d.business_name, s.purchase_date
order by s.purchase_date desc;

-- Write a query that shows the purchase sales income per dealership for the current year.
select d.business_name, sum(s.price), s.purchase_date
from sales s
join dealerships d on s.dealership_id = d.dealership_id
where sales_type_id = 1
	and extract(year from purchase_date) = extract(year from current_date)
group by d.business_name, s.purchase_date
order by s.purchase_date desc;

-- Write a query that shows the total lease income per dealership.
select business_name, sum(s.price)
from sales s
join dealerships d on s.dealership_id = d.dealership_id
where sales_type_id = 2
group by business_name, d.dealership_id
order by d.dealership_id;

-- Write a query that shows the lease income per dealership for the current month.
select d.business_name, sum(s.price), s.purchase_date
from sales s
join dealerships d on s.dealership_id = d.dealership_id
where sales_type_id = 2
	and extract(month from purchase_date) = extract(month from current_date)
group by d.business_name, s.purchase_date
order by s.purchase_date desc;

-- Write a query that shows the lease income per dealership for the current year.
select d.business_name, sum(s.price), s.purchase_date
from sales s
join dealerships d on s.dealership_id = d.dealership_id
where sales_type_id = 2
	and extract(year from purchase_date) = extract(year from current_date)
group by d.business_name, s.purchase_date
order by s.purchase_date desc;

-- Write a query that shows the total income (purchase and lease) per employee.
select 
	e.first_name || ' ' || e.last_name as employee,
	sum(s.price)
from sales s
join employees e on e.employee_id = s.employee_id
where sales_type_id = 1
group by employee;

select 
	e.first_name || ' ' || e.last_name as employee,
	sum(s.price)
from sales s
join employees e on e.employee_id = s.employee_id
where sales_type_id = 2
group by employee;
