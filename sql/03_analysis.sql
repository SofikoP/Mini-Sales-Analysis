SELECT * FROM orders;

SELECT customer_id, first_name, last_name
FROM customers
WHERE city = 'Prague';

SELECT product_name, price
FROM products
WHERE price > 1000;

SELECT order_id, customer_id, order_date
FROM orders
ORDER BY order_date DESC;

SELECT COUNT(order_id)
FROM orders;

SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

SELECT
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;

SELECT
    o.order_id,
    c.first_name,
    p.product_name,
    oi.quantity
FROM  customers c
INNER JOIN orders o
    ON o.customer_id = c.customer_id
INNER JOIN order_items o_i
    ON oi.order_id = o.order_id
INNER JOIN products p
    ON p.product_id = oi.product_id;

SELECT o.order_id, c.first_name, SUM(p.price * oi.quantity) AS total_amount
FROM  customers c
INNER JOIN orders o
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON oi.order_id = o.order_id
INNER JOIN products p
    ON p.product_id = oi.product_id
GROUP BY o.order_id, c.first_name;

SELECT c.customer_id, c.first_name, COUNT(DISTINCT o.order_id) AS orders_count, SUM(p.price * oi.quantity) AS total_spent
FROM  customers c
INNER JOIN orders o
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON oi.order_id = o.order_id
INNER JOIN products p
    ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.first_name;