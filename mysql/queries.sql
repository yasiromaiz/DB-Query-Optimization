-- JOIN
SELECT c.name, p.name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

-- GROUP BY
SELECT p.category, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category;

-- Nested Query
SELECT name FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders WHERE quantity > 1
);

-- Before Index
EXPLAIN SELECT * FROM orders WHERE customer_id = 1;

-- Create Index
CREATE INDEX idx_customer ON orders(customer_id);

-- After Index
EXPLAIN SELECT * FROM orders WHERE customer_id = 1;