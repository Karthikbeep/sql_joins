--1.Show each order along with the name of the customer who placed it (only matching rows).
SELECT c.name,o.order_id
FROM customer c
INNER JOIN orders o ON c.customer_id = o.customer_id;

--2.Show all customers and their order amounts, including customers with no orders.
SELECT c.name,o.amount
FROM customer c
LEFT JOIN orders o  ON c.customer_id = o.customer_id;

--3.Show only the customers who have never placed an order.
SELECT c.name,o.order_id
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

