SET SCHEMA 'new_postgres_connection';
-- create a view
CREATE VIEW customer_and_orders AS
SELECT *
FROM customer c
         JOIN
        "Order" o ON o.customerId = c.id;
