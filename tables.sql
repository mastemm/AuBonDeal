CREATE TABLE users (
    user_UUID UUID PRIMARY KEY, 
    user_pseudo VARCHAR(20) UNIQUE,
    username VARCHAR(20) UNIQUE,
    user_password VARCHAR(72),
    created_at TIMESTAMP  
);

CREATE TABLE products (
    product_UUID UUID PRIMARY KEY,
    product_name VARCHAR(20),
    product_description VARCHAR(128),
    product_price DECIMAL CHECK (product_price) >=0,
    product_quantity INT CHECK (product_quantity) >=0,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
)

CREATE TABLE orders (
    order_numbers SERIAL PRIMARY KEY,
    order_total_cost_ht  DECIMAL,
    order_total_quantity INT CHECK (order_total_quantity) >=0,
    created_at TIMESTAMP,
    deliver_at  TIMESTAMP
    user_UUID UUID REFERENCES users(user_UUID)
);

CREATE TABLE belong (
    product_UUID UUID REFERENCES products(product_UUID),
    order_numbers SERIAL REFERENCES orders(order_numbers)
    
)