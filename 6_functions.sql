SET SCHEMA 'new_postgres_connection';

-- create a function that adds two numbers
CREATE FUNCTION add(INTEGER, INTEGER) RETURNS INTEGER
AS 'SELECT $1 + $2'
LANGUAGE sql
IMMUTABLE
RETURNS NULL ON NULL INPUT;

-- run function

-- works
SELECT add(1,4);

-- doesn't work, first parameter is Numeric
SELECT add(-3.203983, 5);
