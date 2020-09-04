-- Book 2, Chapter 9: CARNIVAL INVENTORY (join + filter practices)

-- Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.
SELECT
	mo.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY
  mo.name
ORDER BY
  COUNT(v.vehicle_id);

-- Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.
SELECT
	mo.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY
  mo.name
ORDER BY
  COUNT(v.vehicle_id) DESC;

-- Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.
select business_name,
	count(vt.model_id)
from sales s
	join dealerships d on s.dealership_id = d.dealership_id
	join vehicles v on s.vehicle_id = v.vehicle_id
	join vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
	join vehiclemodels mo on vt.model_id = mo.vehicle_model_id
where sales_type_id = 1
group by 
	business_name, 
	d.dealership_id,
	vt.model_id
order by d.dealership_id;

-- Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.
select business_name,
	count(vt.model_id)
from sales s
	join dealerships d on s.dealership_id = d.dealership_id
	join vehicles v on s.vehicle_id = v.vehicle_id
	join vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
	join vehiclemodels mo on vt.model_id = mo.vehicle_model_id
where sales_type_id = 1
group by 
	business_name, 
	d.dealership_id,
	vt.model_id
order by d.dealership_id desc;