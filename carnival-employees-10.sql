-- Book 2, Chapter 10: CARNIVAL EMPLOYEES

-- How many employees are there for each role?
select
	et.name,
	count(e.employee_type_id)
from employees e
	join employeetypes et on e.employee_type_id = et.employee_type_id
group by et.name;

-- How many finance managers work at each dealership?
select
	d.business_name,
	count(e.employee_type_id) as finance_managers
from employees e
	join dealershipemployees de on de.employee_id = e.employee_id
	join dealerships d on d.dealership_id = de.dealership_id
where e.employee_type_id = 2
group by d.dealership_id
order by finance_managers desc;

-- Get the names of the top 3 employees who work shifts at the most dealerships?
select
	e.first_name || ' ' || e.last_name as employee,
	count(d.dealership_id) as num_of_dealerships
from employees e
	left join dealershipemployees de on de.employee_id = e.employee_id
	join dealerships d on d.dealership_id = de.dealership_id
group by e.employee_id
order by num_of_dealerships desc;

-- Get a report on the top two employees who has made the most sales through leasing vehicles.
select
	e.first_name || ' ' || e.last_name as employee,
	count(s.sale_id) as num_of_leases
from sales s
	join employees e on s.employee_id = e.employee_id
where s.sales_type_id = 2
group by employee
order by num_of_leases;