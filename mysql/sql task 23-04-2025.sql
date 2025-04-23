use sql_task;
select * from order_items;
select * from customers_1;
select * from orders_1;
select * from products_1;

/*o	Calculate total revenue per month.*/
select month(order_date) as Month, year(order_date) as Year, sum(oi.quantity*oi.price) as Total_Revenue from orders_1 o
join order_items oi 
on o.order_id=oi.order_id
group by month, year;

select date_format(o.order_date, '%M') as Month, sum(oi.quantity*oi.price) as Total_Revenue from orders_1 o
join order_items oi 
on o.order_id=oi.order_id
group by month;

/*o	For each customer, calculate their total spend (total_amount from orders).
o	Show top 5 customers by lifetime value.*/
select c.Customer_id, sum(total_amount) as lifetime_Value from customers_1 c
join orders_1 o 
on c.customer_id=o.customer_id
group by c.customer_id 
order by lifetime_Value desc;

/*o	Join data to find the most frequently ordered product in each region.*/
select product_name, sum(quantity), region from order_items oi
join products_1 p
on oi.product_id=p.product_id
join orders_1 o
on oi.order_id=o.order_id
join customers_1 c
on c.customer_id=o.customer_id
group by product_name, quantity, region
having sum(quantity);

with ProductSalesByRegion as (
    select C.Region,P.Product_Name, SUM(OI.Quantity) as total_quantity from orders_1 O
    join customers_1 C on O.Customer_ID = C.Customer_ID
    join order_items OI on O.Order_ID = OI.Order_ID
    join products_1 P on OI.Product_ID = P.Product_ID
    group by C.Region, P.Product_Name
),
RankedProducts as (select *, rank() over (partition by Region order by total_quantity desc) as Total_rank
    from ProductSalesByRegion
)
select Region,Product_Name,total_quantity from RankedProducts
where Total_rank = 1
order by Region;

/* o	For each product, compute total profit:
	Profit = (price - cost) * quantity
o	Show top 5 most profitable products.
*/
select sum((price - cost) * quantity) as Profit, product_name from order_items oi
join products_1 p
on oi.product_id=p.product_id
join orders_1 o
on oi.order_id=o.order_id
group by product_name;

/* o	In each month, count how many orders were placed by:
	New customers (first-time order)
	Returning customers (second order or later)*/
select DATE_FORMAT(order_date, '%Y-%m') as month,
case when order_date = (select MIN(o2.order_date) from orders_1 o2 where o2.customer_id = o.customer_id) then 'new'
    else 'returning'
    end as type, COUNT(*) as total from orders_1 o
group by month, type;
