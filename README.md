# Brief AuBonDeal BDD Postgresql

## Description
Créer une base de données à partir de diagramme MERISE pour un site de e-commerce.

## MERISE

### Users table

```postgresql
CREATE TABLE users (
    user_UUID UUID PRIMARY KEY, 
    user_pseudo VARCHAR(20) UNIQUE,
    username VARCHAR(20) UNIQUE,
    user_password VARCHAR(72),
    created_at TIMESTAMP  
);
```
- Utilisation du type *UUID* pour une clef primaire plus longue et plus sécurisée
### Products table
```postgresql
CREATE TABLE products (
    product_UUID UUID PRIMARY KEY,
    product_name VARCHAR(20),
    product_description VARCHAR(128),
    product_price DECIMAL CHECK (product_price) >=0,
    product_quantity INT CHECK (product_quantity) >=0,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
)
```
- Utilisation de *DECIMAL* pour avoir un format monetaire
- Utilisation de *TIMESTAMP* pour avoir un format YYYY-MM-DD HH24:MI:SS

### Orders table

```postgresql
CREATE TABLE orders (
    order_numbers SERIAL PRIMARY KEY,
    order_total_cost_ht  DECIMAL,
    order_total_quantity INT CHECK (order_total_quantity) >=0,
    created_at TIMESTAMP,
    deliver_at  TIMESTAMP
    user_UUID UUID REFERENCES users(user_UUID)
);
```
- Utilisation du type *SERIAL* pour une clef primaire auto-incrémentée

### Belong table
```postgresql

CREATE TABLE belong (
    product_UUID UUID REFERENCES products(product_UUID),
    order_numbers SERIAL REFERENCES orders(order_numbers)    
)
```
- Table intermédiaire qui met en relation les tables *products* et *orders* grâce à l'utilisation de foreign keys