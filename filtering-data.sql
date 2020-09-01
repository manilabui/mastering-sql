-- Book 2, Chapter 2: FILTERING DATA

--Get a list of sales records where the sale was a lease.
SELECT
	sale_id, sales_type_id, purchase_date
FROM
	sales
WHERE
	sales_type_id = 2;

--Get a list of sales where the purchase date is within the last two years.
SELECT
	sale_id, purchase_date
FROM
	sales
WHERE
	purchase_date > '2018-08-31';

--Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT
	deposit, payment_method
FROM
	sales
WHERE
	deposit > 5000 OR payment_method = 'American Express';

--Get a list of employees whose first names start with "M" or ends with "E".
SELECT
	first_name
FROM
	employees
WHERE
	first_name LIKE 'M%' OR first_name LIKE '%e';

--Get a list of employees whose phone numbers have the 600 area code.
SELECT
	first_name, phone
FROM
	employees
WHERE
	phone LIKE '600%';