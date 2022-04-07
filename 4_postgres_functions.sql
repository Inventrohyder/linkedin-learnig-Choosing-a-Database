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
