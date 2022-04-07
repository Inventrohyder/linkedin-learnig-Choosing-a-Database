SET SCHEMA 'new_postgres_connection';

-- inheritance
-- You can create a child table that inherits a parent table
-- that means it would have the same attributes as the parent table
-- creating desert table, inherits the products table

CREATE TABLE desserts
(
    chocolate BOOLEAN
)
    INHERITS (Product);
-- check on the desserts table
SELECT *
FROM desserts;
