-- Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses" ON "customers"."id" = "customer_id";

-- Get all orders and their line items (orders, quantity and product).
SELECT orders.*, line_items.quantity, products.description FROM line_items
JOIN orders ON line_items.order_id = orders.id
JOIN products ON line_items.product_id = products.id;

-- Which warehouses have cheetos?
SELECT warehouse, products.description FROM warehouse_product 
JOIN warehouse on warehouse.id = warehouse_product.warehouse_id
JOIN products on warehouse_product.product_id = products.id
WHERE products.description = 'cheetos'

-- Which warehouses have diet pepsi?
SELECT warehouse, products.description FROM warehouse_product
JOIN warehouse on warehouse.id = warehouse_product.warehouse_id
JOIN products on warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi'

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(customers.id) FROM orders
JOIN addresses ON orders.address_id = addresses.id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.id

-- How many customers do we have?
SELECT COUNT(*) FROM customers

-- How many products do we carry?
SELECT COUNT(*) FROM products

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product 
JOIN products ON product_id = products.id
WHERE products.description = 'diet pepsi'

