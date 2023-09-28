--Overviewing the data
SELECT * FROM pizza_sales


--Total Revenue
SELECT CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue FROM pizza_sales


--Average Order Value
SELECT CAST(SUM(total_price) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Average_Order_Value 
FROM pizza_sales


--Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales


--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales


--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))
AS DECIMAL(10,2)) AS Average_Pizzas_Per_Order
FROM pizza_sales


--Daily Trend for Total Orders
SELECT DATENAME(DW,order_date) AS Day, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(DW,order_date),DATEPART(DW,order_date)
ORDER BY DATEPART(DW,order_date)


--Monthly Trend for Total Orders
SELECT DATENAME(MONTH,order_date) as MONTH, COUNT(DISTINCT order_id) as Total_Orders FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date),DATEPART(MONTH,order_date)
ORDER BY DATEPART(MONTH,order_date)


--Percentage of Sales by Pizza Category
SELECT pizza_category AS Pizza_Category,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, 
CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_of_Sales FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_of_Sales


--Percentage of Sales by Pizza Size
SELECT pizza_size AS Pizza_Size,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, 
CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_of_Sales FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_of_Sales DESC


--Total Pizzas Sold by Pizza Category
SELECT pizza_category AS Pizza_Category, SUM(quantity) as Total_Pizzas_Sold FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC


--Top 5 Pizzas by Total Revenue
SELECT TOP 5 pizza_name as Pizza_Name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


--Top 5 Pizzas by Total Quantity
SELECT TOP 5 pizza_name as Pizza_Name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC


--Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name as Pizza_Name, COUNT(DISTINCT order_id) as Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC


--Bottom 5 Pizzas by Total Revenue
SELECT TOP 5 pizza_name as Pizza_Name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue


--Bottom 5 Pizzas by Total Quantity
SELECT TOP 5 pizza_name as Pizza_Name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity


--Bottom 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name as Pizza_Name, COUNT(DISTINCT order_id) as Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders