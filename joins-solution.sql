-- Get all customers and their addresses. --
SELECT first_name, last_name, street, city, state, zip
  FROM addresses JOIN Customers
    ON addresses.customer_id = customers.id
-- Get all orders and their line items. --
SELECT order_date, description, line_items.unit_price, quantity, total
  FROM line_items JOIN products
    ON line_items.product_id = products.id
    JOIN orders
      ON line_items.order_id = orders.id;
-- Which warehouses have cheetos? --
SELECT description, on_hand, warehouse
  FROM warehouse_product JOIN warehouse
    ON warehouse_product.warehouse_id = warehouse.id
    JOIN products
      ON warehouse_product.product_id = products.id
      WHERE product_id=5;
-- Which warehouses have diet pepsi? --
SELECT description, on_hand, warehouse
  FROM warehouse_product JOIN warehouse
    ON warehouse_product.warehouse_id = warehouse.id
    JOIN products
      ON warehouse_product.product_id = products.id
      WHERE product_id=6;
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results. --
SELECT first_name,last_name, count(orders.id) FROM customers
JOIN addresses ON customers.id=addresses.customer_id
JOIN orders ON addresses.id=orders.address_id
GROUP BY customers.id;
-- How many customers do we have? --
SELECT COUNT(DISTINCT id) FROM customers;
-- How many products do we carry? --
SELECT COUNT(DISTINCT id) FROM products;
-- What is the total available on-hand quantity of diet pepsi? --
select sum(on_hand)
FROM warehouse_product JOIN warehouse
   ON warehouse_product.warehouse_id = warehouse.id
   JOIN products
     ON warehouse_product.product_id = products.id
     WHERE product_id=6;
