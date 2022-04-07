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

-- json objects
-- Builds JSON objects and returns them
SELECT JSON_BUILD_OBJECT('id', ProductID, 'name', ProductName, 'category', category)
FROM product;

-- json object into a table
CREATE TABLE product_json
(
    product_names JSON
);

-- insert into the product json table
INSERT INTO product_json
SELECT JSON_BUILD_OBJECT('id', ProductID, 'name', ProductName, 'category', category)
FROM product;

SELECT *
FROM product_json;
