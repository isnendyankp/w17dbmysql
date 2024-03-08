
DROP DATABASE revou_auto_garage;

CREATE DATABASE revou_auto_garage;
USE revou_auto_garage;

-- Customer Table

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address TEXT,
    phone_number VARCHAR(20)
);

INSERT INTO customer (name, address, phone_number) 
VALUES 
('John Doe', '123 Main St, Anytown, USA', '555-1234'),
('Jane Smith', '456 Elm St, Othertown, USA', '555-5678'),
('Alice Johnson', '789 Oak St, Anycity, USA', '555-9012'),
('Bob Brown', '321 Pine St, Otherville, USA', '555-3456'),
('Emily Davis', '654 Cedar St, Anycity, USA', '555-7890'),
('Michael Wilson', '987 Maple St, Othercity, USA', '555-2345'),
('Sarah Lee', '135 Walnut St, Anothercity, USA', '555-6789'),
('David Garcia', '246 Birch St, Somewhere, USA', '555-0123'),
('Laura Martinez', '579 Cherry St, Anytown, USA', '555-4567'),
('Chris Thompson', '864 Pine St, Nowhere, USA', '555-8901');

--  Outlet Table

CREATE TABLE outlet (
    outlet_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address TEXT
);

INSERT INTO outlet (name, address) VALUES 
('Main Street Electronics', '123 Main St, Anytown, USA'),
('Elite Boutique', '456 Elm St, Othertown, USA'),
('City Plaza Furniture', '789 Oak St, Anycity, USA'),
('Cozy Corner Cafe', '321 Pine St, Otherville, USA'),
('Nature Best Grocery', '654 Cedar St, Anycity, USA');

-- Service Table

CREATE TABLE service (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price INT
);

INSERT INTO service (name, price) VALUES 
('Oil Change', 50),
('Tire Rotation', 30),
('Brake Inspection', 40),
('Engine Tune-Up', 100),
('Wheel Alignment', 60);


-- Transaction Table

CREATE TABLE transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_datetime DATETIME,
    customer_id INT,
    outlet_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (outlet_id) REFERENCES outlet(outlet_id)
);


-- Transaction Detail Table

CREATE TABLE transaction_detail (
    transaction_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    service_id INT,
    qty INT,
    price INT,
    FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);

INSERT INTO transaction (transaction_datetime, customer_id, outlet_id) VALUES
('2024-02-27 08:00:00', 3, 2),
('2024-02-27 08:15:00', 8, 3),
('2024-02-27 08:30:00', 5, 1),
('2024-02-27 08:45:00', 2, 4),
('2024-02-27 09:00:00', 7, 5),
('2024-02-27 09:15:00', 1, 3),
('2024-02-27 09:30:00', 4, 2),
('2024-02-27 09:45:00', 9, 1),
('2024-02-27 10:00:00', 6, 4),
('2024-02-27 10:15:00', 3, 5),
('2024-02-27 10:30:00', 8, 2),
('2024-02-27 10:45:00', 5, 3),
('2024-02-27 11:00:00', 2, 1),
('2024-02-27 11:15:00', 7, 4),
('2024-02-27 11:30:00', 1, 5),
('2024-02-27 11:45:00', 4, 3),
('2024-02-27 12:00:00', 9, 2),
('2024-02-27 12:15:00', 6, 1),
('2024-02-27 12:30:00', 3, 4),
('2024-02-27 12:45:00', 8, 5),
('2024-02-27 13:00:00', 5, 2),
('2024-02-27 13:15:00', 2, 3),
('2024-02-27 13:30:00', 7, 1),
('2024-02-27 13:45:00', 1, 4),
('2024-02-27 14:00:00', 4, 5),
('2024-02-27 14:15:00', 9, 3),
('2024-02-27 14:30:00', 6, 2),
('2024-02-27 14:45:00', 3, 1),
('2024-02-27 15:00:00', 8, 4);

DROP TABLE transaction_detail;
INSERT INTO transaction_detail (transaction_id, service_id, qty, price) VALUES
(1, 3, 2, 100),
(2, 1, 3, 245),
(3, 5, 1, 125),
(4, 2, 2, 40),
(5, 4, 3, 28),
(6, 1, 1, 12),
(7, 3, 3, 4),
(8, 5, 2, 8),
(9, 4, 1, 56),
(10, 2, 3, 90),
(11, 1, 2, 23),
(12, 3, 1, 17),
(13, 5, 3, 39),
(14, 2, 1, 40),
(15, 4, 2, 6),
(16, 1, 3, 12),
(17, 3, 2, 29),
(18, 5, 1, 35),
(19, 2, 2, 31),
(20, 4, 3, 38),
(21, 1, 1, 12),
(22, 3, 3, 15),
(23, 5, 2, 16),
(24, 4, 1, 18),
(25, 2, 3, 23),
(26, 1, 2, 31),
(27, 3, 1, 56),
(28, 5, 3, 12),
(29, 2, 1, 30),
(20, 4, 2, 27),
(28, 5, 1, 14),
(13, 5, 1, 27),
(22, 1, 4, 29),
(11, 3, 1, 34),
(7, 5, 5, 35),
(2, 2, 3, 37),
(4, 5, 1, 39);

INSERT INTO customer (name, address, phone_number) 
VALUES 
('Laura K.', '125 Main, Washington, USA', '555-1235');

