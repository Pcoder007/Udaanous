use sql_task;
select * from customers;
select * from orders;
select * from products;

/*•	List all customers and their cities.*/
select concat(first_name, " ", last_name) as Customers, city from customers;

/*•	Display each order with customer full name, product name, and total price (quantity × price).*/
select concat(first_name," ", last_name) as Full_Name, Product_Name, (price*quantity) as Total_Price from customers c
inner join products p
on c.customer_id=p.product_id
inner join orders o
on o.customer_id=c.customer_id;

/*•	Show all orders placed in March 2024.*/
select * from orders where month(order_date) = 03 and year(order_date) = 2024;

/*•	Count how many times each product has been ordered.*/
select count(*) as Count_Of_Products, p.product_name from products p
inner join orders o 
on p.product_id=o.product_id
group by p.product_name having count(o.product_id);

/*•	Calculate total revenue generated from each product.*/
select p.product_name, sum(o.quantity*p.price) as Total_Revenue from products p
inner join orders o
on p.product_id=o.product_id
group by p.product_name;

/*•	Identify the customer who spent the most.*/
select concat(first_name," ", last_name) as customer_name , sum(p.price*o.quantity) as Total_Price from customers c 
inner join orders o
on c.customer_id = o.customer_id
inner join products p
on o.product_id = p.product_id
group by customer_name order by Total_Price desc limit 1;

/*•	Which city has the highest average spending per customer?*/
select avg(o.quantity*p.price) as Avg_Spending, city from customers c 
inner join orders o
on c.customer_id = o.customer_id
inner join products p
on o.product_id = p.product_id
group by c.city order by Avg_Spending desc limit 1;




