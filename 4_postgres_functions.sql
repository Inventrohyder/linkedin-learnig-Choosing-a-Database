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


-- full outer join
-- This is not supported by all DBMS(s)
-- It returns all the rows from both tables
SELECT *
FROM customer c
         FULL OUTER JOIN "Order" o
                         ON o.customerId = c.id;

-- check constraints
-- Create a fake table
CREATE TABLE christmas_products
(
    id        TEXT    NOT NULL,
    price     INTEGER NOT NULL CHECK (price > 0), -- contraint
    christmas BOOLEAN
);

-- insert values into christmas_products to see if constraint works
-- This should work
INSERT INTO christmas_products
VALUES ('abc', 23, 'yes');

-- check if values insert into christmas_products
SELECT *
FROM christmas_products;

-- test price constraint again in christmas products
-- This should fail
INSERT INTO christmas_products
VALUES ('xyz', -1, 'yes');

-- boolean test
-- This should work
INSERT INTO christmas_products
VALUES ('abc', 23, true);
