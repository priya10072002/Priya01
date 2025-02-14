
     5. Retail Store Inventory System
REATE DATABASE RetailDB;
USE RetailDB;
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);
CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact VARCHAR(50)
);
CREATE TABLE Sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);
#Sample Data for Products
INSERT INTO Products (name, price, stock) VALUES
('Laptop', 999.99, 50),
('Smartphone', 499.99, 100),
('Headphones', 79.99, 30),
('Keyboard', 29.99, 20),
('Mouse', 19.99, 15);
#Sample Data for Supplierrs
INSERT INTO Suppliers (name, contact) VALUES
('Tech Supplies Co.', 'techsupplies@example.com'),
('Gadget World', 'gadgetworld@example.com');
#Sample Data for Sales
INSERT INTO Sales (product_id, date, quantity, total_price) VALUES
(1, '2025-01-01', 3, 2999.97),
(2, '2025-01-02', 5, 2499.95),
(3, '2025-01-03', 10, 799.90),
(4, '2025-01-04', 2, 59.98),
(5, '2025-01-05', 4, 79.96);
#list the all the products
SELECT * FROM Products;
#- Show products with stock less than 10.
SELECT * FROM Products WHERE stock < 10;
#List sales with product names and total prices.
SELECT 
    Sales.id, 
    Products.name AS product_name, 
    Sales.date, 
    Sales.quantity, 
    Sales.total_price
FROM Sales
JOIN Products ON Sales.product_id = Products.id;
#Calculate the total sales for each product.
SELECT SUM(quantity *  total_price) AS TotalSalesAmount FROM Sales;
select*from retailDB;
