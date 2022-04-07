SET SCHEMA 'new_postgres_connection';
-- create a view
CREATE VIEW customer_and_orders AS
SELECT *
FROM customer c
         JOIN
        "Order" o ON o.customerId = c.id;

-- check what's inside the view
SELECT *
FROM customer_and_orders;


-- create a materialized view
CREATE MATERIALIZED VIEW customers_and_orders_mat AS
SELECT *
FROM customer c
	JOIN
	"Order" o ON o.customerId = c.id;

-- check what's inside the materialized view
SELECT *
FROM customers_and_orders_mat; 

-- The difference between a view and a materialized view
-- update the customers table
UPDATE customer
SET city = 'New York'
WHERE city = 'Philadelphia';

-- check inside the customers table
SELECT *
FROM customer;

-- If we check the materialized view, it would have the old data
-- because it only runs once when it was created
-- and the normal view runs the query everytime it is checked


-- refresh materialized view
REFRESH MATERIALIZED VIEW customers_and_orders_mat;
