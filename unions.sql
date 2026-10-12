--1.Show a combined list of all customers (name and city) from both tables, with no duplicates.
SELECT name,city
FROM store_customers
UNION 
SELECT name,city
FROM online_customers;

--2.Show the same combined list, but keeping duplicates. How many rows do you get compared to question 1?
SELECT name,city
FROM store_customers
UNION ALL
SELECT name,city
FROM online_customers;

--3.Show only the customers who appear in both tables.
SELECT name
FROM store_customers
INTERSECT
SELECT name
FROM online_customers;

--4.Show the customers who shop in the store but never online.
SELECT name
FROM store_customers
EXCEPT
SELECT name
FROM online_customers;

--5.Show the customers who shop online but never in the store.
SELECT name
FROM online_customers
EXCEPT
SELECT name
FROM store_customers;

--6.Show the list of all unique cities from both tables combined, sorted alphabetically.
SELECT city
FROM store_customers
UNION 
SELECT city
FROM online_customers;

--7.Show every name from both tables with a column called source saying ‘store’ or ‘online’, keeping duplicates. Sort by name.
SELECT name, 'store' AS source
FROM store_customers
UNION ALL
SELECT name, 'online' AS source
FROM online_customers
ORDER BY name;

--8.Solve question 3 again, but using an INNER JOIN instead of INTERSECT. Are the results the same?
SELECT s.name
FROM store_customers s
INNER JOIN online_customers o ON s.name = o.name;

--No I got Asha in the output as well

--9.Solve question 4 again, but using a LEFT JOIN instead of EXCEPT.
SELECT s.name
FROM store_customers s
LEFT JOIN online_customers o ON s.name = o.name
WHERE o.name IS NULL;

--10.Show how many times each name appears across both tables combined, but only for names that appear more than once
SELECT COUNT(name),store_customers.city
FROM store_customers
UNION ALL
SELECT COUNT(name),online_customers.city
FROM online_customers
GROUP BY store_customers.city,online_customers.city;