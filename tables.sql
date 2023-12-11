CREATE TABLE users (
    user_UUID
    user_pseudo
    username
    user_password
    created_at
);

CREATE TABLE products (
    product_UUID
    product_name
    product_description
    product_price
    product_quantity
    created_at
    updated_at
)

CREATE TABLE orders (
    order_numbers INT PRIMARY KEY NOT NULL,
    order_total_cost_ht  
    order_total_quantity
    created_at
    deliver_at  
);

CREATE TABLE belong (
    
)