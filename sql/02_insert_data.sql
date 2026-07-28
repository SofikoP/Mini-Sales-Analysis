INSERT INTO customers (customer_id, first_name, last_name, city, registration_date)
VALUES
(1, 'Alice', 'Brown', 'Prague', '2025-01-12'),
(2, 'John', 'Smith', 'Brno', '2025-02-05'),
(3, 'Emma', 'Johnson', 'Prague', '2025-02-18'),
(4, 'Michael', 'Wilson', 'Ostrava', '2025-03-01'),
(5, 'Sophia', 'Taylor', 'Brno', '2025-03-15'),
(6, 'Daniel', 'Moore', 'Plzen', '2025-04-10'),
(7, 'Olivia', 'Martin', 'Prague', '2025-04-25'),
(8, 'James', 'Anderson', 'Liberec', '2025-05-06'),
(9, 'Charlotte', 'Thomas', 'Brno', '2025-05-20'),
(10, 'William', 'Jackson', 'Prague', '2025-06-02');


INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'iPhone 17 Pro', 'Smartphone', 1299.00),
(2, 'Samsung Galaxy S26', 'Smartphone', 1199.00),
(3, 'MacBook Air M5', 'Laptop', 1499.00),
(4, 'Dell XPS 15', 'Laptop', 1899.00),
(5, 'iPad Air', 'Tablet', 699.00),
(6, 'AirPods Pro 3', 'Headphones', 279.00),
(7, 'Logitech MX Master 4', 'Mouse', 129.00),
(8, 'Keychron K8 Pro', 'Keyboard', 109.00),
(9, 'LG UltraFine 27', 'Monitor', 499.00),
(10, 'Sony WH-1000XM6', 'Headphones', 399.00);

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
(1, 1, '2025-06-10'),
(2, 2, '2025-06-12'),
(3, 3, '2025-06-15'),
(4, 1, '2025-06-20'),
(5, 5, '2025-06-21'),
(6, 4, '2025-06-25'),
(7, 7, '2025-07-01'),
(8, 6, '2025-07-03'),
(9, 3, '2025-07-05'),
(10, 8, '2025-07-08'),
(11, 9, '2025-07-12'),
(12, 10, '2025-07-15'),
(13, 2, '2025-07-18'),
(14, 5, '2025-07-20'),
(15, 7, '2025-07-25');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 6, 2),

(3, 2, 3, 1),
(4, 2, 8, 1),

(5, 3, 2, 1),
(6, 3, 7, 1),

(7, 4, 5, 1),
(8, 4, 6, 1),

(9, 5, 9, 2),

(10, 6, 4, 1),
(11, 6, 10, 1),

(12, 7, 1, 1),
(13, 7, 8, 1),

(14, 8, 5, 2),

(15, 9, 6, 1),
(16, 9, 7, 2),

(17, 10, 3, 1),

(18, 11, 2, 1),
(19, 11, 10, 1),

(20, 12, 9, 1),
(21, 12, 8, 1),

(22, 13, 1, 1),
(23, 13, 6, 1),

(24, 14, 5, 1),
(25, 14, 7, 1),
(26, 14, 10, 1),

(27, 15, 4, 1),
(28, 15, 9, 2);