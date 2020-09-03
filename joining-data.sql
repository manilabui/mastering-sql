-- Book 2, Chapter 3: JOINING DATA

-- Get a list of the sales that was made for each sales type.
select 
	sale_id, st.name
from sales s
left join salestypes st
	on s.sales_type_id = st.sales_type_id;

-- Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
select
	sale_id,
	vin,
	c.first_name as customer_first,
	c.last_name as customer_last,
	e.first_name as employee_first,
	e.last_name as employee_last,
	business_name,
	d.city as dealership_city,
	d.state as dealership_state
from sales s
inner join vehicles v
	on s.vehicle_id = v.vehicle_id
left join customers c
	on s.customer_id = c.customer_id
left join employees e
	on s.employee_id = e.employee_id
left join dealerships d
	on s.dealership_id = d.dealership_id;

-- Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
select
	business_name,
	first_name,
	last_name
from dealerships d
left join dealershipemployees de
	on d.dealership_id = de.dealership_id
left join employees e
	on de.dealership_id = e.dealership_id;

-- Get a list of vehicles with the names of the body type, make, model and color.
select
	vehicle_id,
	vbt.name as body_type,
	vma.name as make,
	vmo.name as model,
	exterior_color
from vehicles v
left join vehicletypes vt
	on v.vehicle_type_id = vt.vehicle_type_id
inner join vehiclebodytype vbt
	on vt.vehicle_body_type_id = vbt.vehicle_body_type_id
inner join vehiclemake vma
	on vt.vehicle_make_id = vma.vehicle_make_id
inner join vehiclemodel vmo
	on vt.vehicle_model_id = vmo.vehicle_model_id;
