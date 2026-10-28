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
INNER JOIN order_items oi
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

SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT p.product_name, SUM(p.price * oi.quantity) AS revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 5;

SELECT c.customer_id, c.first_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.first_name,
        SUM(p.price * oi.quantity) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON p.product_id = oi.product_id
    GROUP BY c.customer_id, c.first_name
)
SELECT first_name, total_spent
FROM customer_spending
WHERE total_spent = (
    SELECT MAX(total_spent)
    FROM customer_spending
);

WITH customer_items AS (
    SELECT c.customer_id, c.first_name, SUM(oi.quantity) AS total_items
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name)

SELECT
    customer_id,
    first_name,
    total_items
FROM customer_items
WHERE total_items > 10;

WITH customer_items AS (
    SELECT
        c.customer_id,
        c.first_name,
        SUM(oi.quantity) AS total_items,
        ROW_NUMBER() OVER (
            ORDER BY SUM(oi.quantity) DESC
        ) AS row_num
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.first_name
)

SELECT *
FROM customer_items;

WITH order_quantity AS (
    SELECT
        o.order_date,
        o.order_id,
        SUM(oi.quantity) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        o.order_id,
        o.order_date
)

SELECT
    order_date,
    order_total,
    SUM(order_total) OVER (
        ORDER BY order_date
    ) AS running_total
FROM order_quantity;

