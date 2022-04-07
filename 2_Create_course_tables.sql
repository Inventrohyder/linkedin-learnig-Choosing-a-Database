SET SCHEMA 'new_postgres_connection';
CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    FirstName  VARCHAR(20),
    LastName   VARCHAR(20),
    Email      VARCHAR(50),
    Phone      VARCHAR(15),
    Address    VARCHAR(40),
    City       VARCHAR(20),
    State      VARCHAR(10),
    Zipcode    INT
);

CREATE TABLE DeliveryDriver
(
    DriverID  INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName  VARCHAR(20),
    Email     VARCHAR(50),
    Phone     VARCHAR(15),
    Address   VARCHAR(40),
    City      VARCHAR(20),
    State     VARCHAR(10),
    Zipcode   INT
);

CREATE TABLE Product
(
    ProductID   VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(30),
    Category    VARCHAR(10),
    Description VARCHAR(500),
    Price       VARCHAR(10),
    ImageURL    VARCHAR(100)
);

CREATE TABLE "Order"
(
    OrderID    INT PRIMARY KEY,
    OrderDate  VARCHAR(10),
    TotalDue   VARCHAR(10),
    Status     VARCHAR(10),
    CustomerID INT,
    DriverID   INT,
    CONSTRAINT order_customer_fk
        FOREIGN KEY (CustomerID)
            REFERENCES Customer (CustomerID),
    CONSTRAINT order_driver_fk
        FOREIGN KEY (DriverID)
            REFERENCES DeliveryDriver (DriverID)
);

CREATE TABLE OrderItem
(
    OrderItemID VARCHAR(10) PRIMARY KEY,
    OrderID     INT,
    ProductID   VARCHAR(10),
    Quantity    INT,
    CONSTRAINT orderItem_order_fk
        FOREIGN KEY (OrderID)
            REFERENCES "Order" (OrderID),
    CONSTRAINT orderItem_product_fk
        FOREIGN KEY (ProductID)
            REFERENCES Product (ProductID)
);
