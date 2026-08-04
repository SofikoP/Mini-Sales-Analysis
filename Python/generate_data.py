import random
from datetime import datetime, timedelta


start_date = datetime(2025, 1, 1)
end_date = datetime(2025, 12, 31)

def random_date():
    days = (end_date - start_date).days
    random_days = random.randint(0, days)
    return (start_date + timedelta(days=random_days)).strftime("%Y-%m-%d")

with open("../sql/04_insert_random_orders.sql", "w") as file:

    for order_id in range(16, 216):
        customer_id = random.randint(1, 10)
        order_date = random_date()

        file.write(
            f"INSERT INTO orders (order_id, customer_id, order_date)"
            f"VALUES ({order_id}, {customer_id}, '{order_date}');\n"
            )

with open("../sql/05_insert_random_order_items.sql", "w") as file:

    order_item_id = 29

    for order_id in range(16, 216):
        items_count = random.randint(1, 5)
        for _ in range(items_count):
            product_id = random.randint(1, 10)
            quantity = random.randint(1, 4)

            file.write(f"INSERT INTO order_items (order_item_id, order_id, product_id, quantity)"
            f"VALUES ({order_item_id}, {order_id}, {product_id}, {quantity});\n")
            order_item_id += 1