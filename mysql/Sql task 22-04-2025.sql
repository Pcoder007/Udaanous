use sql_task;
select * from sales_data;

/*Total Sales Value*/
select sum(quantity*price) as Total_Sales from sales_data;

/*Monthly Sales Trends*/
select format(order_date, 'yyyy-mm') as monthly_sale, sum(quantity*price) as Total_Sales from sales_data
group by monthly_sale order by monthly_sale;

/*List the top 5 best-selling products based on total revenue.*/
select product_name, sum(quantity*price) as Total_Sale from sales_data
group by product_name order by Total_sale desc limit 5;

/*o	Show total sales value per region.*/
select region, sum(quantity*price) as Total_Sales from sales_data
group by region;

/*o	Find the number of orders placed by each customer. Return top 10 most frequent buyers.*/
select customer_id, count(*) as Total_orders from sales_data
group by customer_id order by Total_orders desc limit 10;

/*o	What percentage of total revenue does each product category contribute?*/
select category, round(sum(quantity*price) * 100 / (select sum(quantity*price) from sales_data), 2) as Revenue_Percentage
from sales_data group by category;

/*o	Calculate how many customers have made more than one purchase.*/
select customer_id, count(customer_id) from sales_data 
group by customer_id having count(customer_id) > 1;

select count(*) as Repeated_Customers
from (select customer_id from sales_data group by customer_id having count(customer_id) > 1) as Repeated;
