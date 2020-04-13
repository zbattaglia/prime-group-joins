-- 1. Get all customers and their addresses.
SELECT "street", "city", "state", "zip", "customers"."first_name", "customers"."last_name" FROM "addresses"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "order_id", "order_date", "line_items"."quantity", "products"."description" FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

-- 3. Which warehouses have cheetos? (Returns delta)
SELECT "warehouse", "products"."description" FROM "warehouse_product"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "description" = 'cheetos';

--4. Which warehouses have diet pepsi? (Returns alpha, delta, and gamma)
SELECT "warehouse", "products"."description" FROM "warehouse_product"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "description" = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", COUNT("orders"."id") FROM "addresses"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "first_name";

--6. How many customers do we have? (Returns 4)
SELECT COUNT("id") FROM "customers";

--7. How many products do we carry? (Returns 7)
SELECT COUNT("id") FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
GROUP BY "products"."description";
