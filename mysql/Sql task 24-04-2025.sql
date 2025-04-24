use sql_task;
select * from customers_2;
select * from orders_2;

SELECT name, region, SUM(total_amount) AS total_spent, COUNT(*) AS order_count
FROM orders_2 o
JOIN customers_2 c ON o.customer_id = c.customer_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY o.customer_id, name, region
HAVING order_count > 3
ORDER BY region, total_spent DESC limit 5;
