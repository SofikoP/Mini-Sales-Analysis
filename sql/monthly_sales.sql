SELECT  strftime('%Y-%m', o.order_date) AS month, SUM(p.price * oi.quantity) AS revenue
FROM  orders o
INNER JOIN order_items oi
    ON oi.order_id = o.order_id
INNER JOIN products p
    ON p.product_id = oi.product_id
GROUP BY strftime('%Y-%m', o.order_date)
ORDER BY month;