-- Display How many trasaction every customer make

-- inner join
SELECT c.name, COUNT(t.transaction_id)
FROM customer AS c
	JOIN transaction AS t ON c.customer_id=t.customer_id
GROUP BY name;

-- left join
SELECT c.name, COUNT(t.transaction_id)
FROM customer AS c
	LEFT JOIN transaction AS t ON c.customer_id=t.customer_id
GROUP BY name;

-- HAVING
SELECT c.name, COUNT(t.transaction_id)
FROM customer AS c
	JOIN transaction AS t ON c.customer_id=t.customer_id
GROUP BY name
HAVING COUNT(t.transaction_id) > 3;

-- Display all service name and outlet name in 1 result
SELECT service.name
FROM service
UNION
SELECT outlet.name
FROM outlet;

-- Display all customer where their name begin with A, but please use subquery

SELECT *
FROM customer
WHERE name LIKE 'a%';

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id FROM customer WHERE name like 'a%'
);

-- Display all transaction with the customer name
SELECT t.*, c.name
FROM customer c
	JOIN transaction t ON c.customer_id=t.customer_id;
    
 -- display customer id, name address, phone number, name   
SELECT t.*, c.name
FROM customer t
	JOIN (
		SELECT customer_id, name AS name, address
			FROM customer
    ) AS c ON t.customer_id = c.customer_id;

-- please create 2 new service to service table
INSERT INTO service (name, price)
VALUES
	("Tire Change", 15000),
    ("Change Brake Pads", 3000);

-- checking service after create 2 new service
SELECT * FROM service;

-- create new service pada urutan 15
INSERT INTO service (service_id, name, price)
VALUES
	(15, "Tire Change 2", 15000);
    
-- checking service after create service urutan 15
SELECT * FROM service;

-- create new service pada langsung ke urutan 16 karena terakhir 15
INSERT INTO service (name, price)
VALUES
	("Tire Change 3", 15000);
    
-- checking service after create service urutan 16
SELECT * FROM service;

-- increase all service price by 10%
UPDATE service
SET price = price * 1.1
WHERE service_id=2;

-- checking service after increase all service price by 10%
SELECT * FROM service;

-- DELETE service 15
DELETE FROM service
WHERE service_id=15;

-- checking service after DELETE service 15
SELECT * FROM service;

START TRANSACTION;
-- Create transaction
-- Berhasil
INSERT INTO transaction (transaction_datetime, customer_id, outlet_id)
	VALUES('2024-02-28 1:00:00', 1, 1);
    
-- Create transaction_detail
-- Gagal
INSERT INTO transaction_detail (transaction_id, service_id, qty, price)
	VALUES(500, 1, 1, 50);

-- Commit hanya menyimpan yang berhasil    
COMMIT;
-- rollback kembali ke tanggal seblum 28 
ROLLBACK;

-- checking service learn commit and rollback
SELECT * FROM transaction;

-- Learn index
SELECT *
FROM transaction
WHERE customer_id;

-- create index
CREATE INDEX transaction_idx
	ON transaction (customer_id, outlet_id);

-- EXPLAIN
-- to show detail like a possible key using index or not
EXPLAIN SELECT *
FROM transaction
WHERE customer_id;