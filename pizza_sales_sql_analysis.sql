select * from pizza_sales

select sum(total_price)  as total_Revenue  from pizza_sales

select sum(total_price)/count(distinct(order_id)) as avg_order_value from pizza_sales

select sum(quantity) as total_pizza_sold from pizza_sales

select count(distinct(order_id)) as total_orders from pizza_sales

select cast(cast(sum(quantity)as decimal(10,2))/cast(count(distinct (order_id)) as decimal(10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales

select DATENAME(DW,order_date) AS ORDRE_DAY,COUNT(DISTINCT(order_id)) AS TOTAL_ORDERS FROm PIZZA_SALES 
GROUP BY DATENAME(DW,ORDER_DATE)
order by TOTAL_ORDERS desc

select datename(month,order_date) as month_name, count(distinct(order_id)) as total_order from pizza_sales
group by datename(month,order_date)
order by total_order desc

select pizza_category,sum(total_price) ,sum(total_price)*100/(select sum(total_price)  from pizza_sales where month(order_date)=1) as PCT
from pizza_sales
where month(order_date)=1
group by pizza_category

select pizza_category,sum(total_price) ,sum(total_price)*100/(select sum(total_price)  from pizza_sales ) as PCT
from pizza_sales
group by pizza_category

select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales ,cast(sum(total_price)*100/(select sum(total_price)  from pizza_sales where DATEPART(QUARTER,order_date)=1 ) as decimal(10,2)) as PCT
from pizza_sales
where DATEPART(QUARTER,order_date)=1
group by pizza_size
order by PCT DESC


select top 5 pizza_name,sum(total_price) as total_Revenue from pizza_sales
group by pizza_name
order by total_Revenue desc 

select top 5 pizza_name,sum(total_price) as total_Revenue from pizza_sales
group by pizza_name
order by total_Revenue 

select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity  desc

select top 5 pizza_name,count(distinct (order_id)) as total_orders from pizza_sales
group by pizza_name
order by total_orders  desc





