SET SCHEMA 'new_postgres_connection';

-- fetch statement
-- LIMIT is not considered SQL standard
-- therefore Postgres allows both
SELECT *
FROM customer
LIMIT 10;

SELECT *
FROM customer
FETCH FIRST 10 ROWS ONLY;

-- intersect statement
-- this is similar to the INNER JOIN
SELECT DISTINCT c.id
FROM customer c
JOIN "Order" o ON o.customerId = c.id;

SELECT id
FROM customer
INTERSECT
SELECT customerID
FROM "Order";
-- We don't require the DISTINCT keyword while using INTERSECT
-- It is implied by INTERSECT and it chooses the values making
-- them appear once
