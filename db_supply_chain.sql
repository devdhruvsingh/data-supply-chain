SELECT * FROM orders LIMIT 10;

-- TOTAL SALES AND PROFITS
SELECT 
    SUM(sales) AS total_revenue, 
    SUM(benefit_per_order) AS total_profit 
FROM orders;

--How many orders fall into each status (Complete, Pending, etc.)?
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- top 5 countries placing most orders
SELECT order_country, COUNT(*) AS "total_orders"
FROM orders
GROUP BY order_country
ORDER BY total_orders;

-- what is the most popular payment method used by customers?
SELECT type, COUNT(*) AS "total_payment" 
FROM orders
GROUP BY type
ORDER BY total_payment;

-- list the name and sales of all the orders suspected of fraud
CREATE VIEW fraud_suspects AS
SELECT customer_fullname, sales, order_city
FROM orders
WHERE 
is_fraud = 1;

SELECT count(*) FROM fraud_suspects;


-- what percentage of orders are late in each market
SELECT 
    market, 
    ROUND(AVG(is_late) * 100, 2) AS late_delivery_percentage
FROM orders
GROUP BY market
ORDER BY late_delivery_percentage DESC;

-- which 5 product categories have the highest average profit margin
SELECT category_name, ROUND(AVG(profit_margin_pct :: "numeric"), 2) AS avg_margin
FROM orders
GROUP BY category_name
ORDER BY avg_margin DESC
LIMIT 5;


-- which shipping mode has the  worst avg delay
SELECT shipping_mode, ROUND(AVG(shipping_delay), 2) AS avg_delay_days
FROM orders
GROUP BY shipping_mode
ORDER BY avg_delay_days DESC;

-- What is the total sales amount for each month?
SELECT order_year_month, SUM(sales) AS monthly_revenue
FROM orders
GROUP BY order_year_month
ORDER BY order_year_month;

-- Who are the top 10 customers based on total spending?
SELECT customer_fullname, SUM(sales_per_customer) AS total_spent
FROM orders
GROUP BY customer_fullname
ORDER BY total_spent DESC
LIMIT 10;


-- Which regions have an average shipping delay worse than the overall global average?
SELECT market_region, AVG(shipping_delay) AS regional_avg_delay
FROM orders
GROUP BY market_region
HAVING AVG(shipping_delay) > (SELECT AVG(shipping_delay) FROM orders)
ORDER BY regional_avg_delay DESC;

-- What is the #1 best-selling product (by quantity) in every single category?
SELECT category_name, product_name, total_quantity
FROM (
    SELECT 
        category_name, 
        product_name, 
        SUM(order_item_quantity) AS total_quantity,
        RANK() OVER (PARTITION BY category_name ORDER BY SUM(order_item_quantity) DESC) as rank
    FROM orders
    GROUP BY category_name, product_name
) ranked_products
WHERE rank = 1;




