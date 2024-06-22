----------------------------------------------- Generic Questions --------------------------------------------------
-- 1. How many unique cities does the data have?
SELECT 
    COUNT(DISTINCT (city)) Cities
FROM
    walmartdata;
    
-- 2. In which city has which branche ?

SELECT DISTINCT
    city, branch
FROM
    walmartdata;
    
-------------------------------------------------- Product -----------------------------------------------------------
-- 1. How many unique product lines does the data have?

SELECT 
    COUNT(DISTINCT (product_line))
FROM
    walmartdata;  -- we do have 6 product lines in data.

-- 2. What is the most common payment method?

SELECT 
    payment, COUNT(payment) cnt
FROM
    walmartdata
GROUP BY payment
ORDER BY 2 DESC;  -- Ewallet is clearly the most commonly used payment method in the data.

-- 3. What is the most selling product line?

SELECT 
    product_line, COUNT(product_line) cnt
FROM
    walmartdata
GROUP BY product_line
ORDER BY 2 DESC;   -- Fashion accessories are the most selling product line.

-- 4. What is the total revenue by month?

SELECT 
    month_name, SUM(total) AS revenue
FROM
    walmartdata
GROUP BY month_name
order by 2 desc;   -- january has most sales as compared to march and feb.

-- 5. What month had the largest COGS?

SELECT 
    month_name, SUM(cogs) AS cogs
FROM
    walmartdata
GROUP BY month_name
ORDER BY 2 DESC;  -- clearly nore the revnue more the cost of goods sold hence they are corelated to each other.

-- 6. What product line had the largest revenue?

SELECT 
    product_line, sum(total) largest_rev
FROM
    walmartdata
GROUP BY product_line
ORDER BY 2 DESC;   -- food and bevs have largest revenue among all prod lines.

-- 7. What is the city with the largest revenue?

SELECT 
    city, sum(total) largest_rev
FROM
    walmartdata
GROUP BY city
ORDER BY 2 DESC; -- naypyitaw is the largest revenue city among all the cities.

-- 8. What product line had the largest VAT?

SELECT 
    product_line, avg(vat) avg_vat
FROM
    walmartdata
GROUP BY product_line
ORDER BY 2 DESC;  -- home and lifestyle has largest vat.

-- 9. Which branch sold more products than average product sold?

SELECT 
    branch, SUM(quantity) AS qty
FROM
    walmartdata
GROUP BY branch
HAVING SUM(quantity) > AVG(quantity);

-- 10. What is the most common product line by gender?

SELECT 
    gender, product_line, COUNT(product_line)
FROM
    walmartdata
GROUP BY gender , product_line
ORDER BY 3 DESC;

-- 11. What is the average rating of each product line?

select product_line, round(avg(rating),2) as avg_rat
from walmartdata
group by product_line;

-- 12. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales. 

SELECT product_line,
       (CASE 
            WHEN total > avg_total THEN 'Good' 
            ELSE 'Bad' 
        END) AS prod_type
FROM (
    SELECT product_line,
           total,
           AVG(total) OVER (PARTITION BY product_line) AS avg_total
    FROM walmartdata
) AS subquery;

----------------------------------------- Sales -----------------------------------------------------

-- 1. Number of sales made in each time of the day per weekday

SELECT 
    time_of_day, SUM(total) AS sales
FROM
    walmartdata
GROUP BY time_of_day
ORDER BY 2 DESC;   -- sales are high at the evening time of the day.

-- 2. Which of the customer types brings the most revenue?

SELECT 
    customer_type, SUM(total) AS sales
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;   -- member type customers are bringing more sales than normal customers.

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)?

SELECT 
    city, avg(vat) AS max_vat
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;

-- 4. Which customer type pays the most in VAT?

SELECT 
    customer_type, avg(vat) AS max_vat
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;  -- member type customers are paying more tax. 

----------------------------------------- Customer ---------------------------------------------
-- 1. How many unique customer types does the data have?

SELECT DISTINCT
    customer_type
FROM
    walmartdata;

-- 2. How many unique payment methods does the data have?

SELECT DISTINCT
    payment
FROM
    walmartdata;

-- 3. What is the most common customer type?

SELECT 
    customer_type, COUNT(customer_type) AS cnt
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;

-- 4. Which customer type buys the most?

SELECT 
    customer_type, sum(total) AS most_sales
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;

-- 5. What is the gender of most of the customers?

SELECT 
    gender, COUNT(*) AS cnt
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;

-- 6. What is the gender distribution per branch?

SELECT 
    branch, gender, COUNT(*)
FROM
    walmartdata
GROUP BY 1 , 2
ORDER BY 1;

-- 7. Which time of the day do customers give most ratings?

SELECT 
    time_of_day, COUNT(rating) AS cnt
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;

-- 8. Which time of the day do customers give most ratings per branch?

SELECT 
    branch, time_of_day, COUNT(rating) AS cnt
FROM
    walmartdata
GROUP BY 1,2
ORDER BY 1;

-- 9. Which day of the week has the best avg ratings?

SELECT 
    day_name, AVG(rating) AS ratings
FROM
    walmartdata
GROUP BY 1
ORDER BY 2 DESC;

-- 10. Which day of the week has the best average ratings per branch?

SELECT 
    branch,day_name, AVG(rating) AS ratings
FROM
    walmartdata
GROUP BY 1,2
ORDER BY 1,3 desc;
