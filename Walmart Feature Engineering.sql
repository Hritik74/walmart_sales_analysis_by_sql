-- Feature Engineering -----

/* 1. Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. 
This will help answer the question on which part of the day most sales are made.*/

-- spliting time into three categories i.e. morning, afternoon and evening.
SELECT 
    *,
    CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM
    walmartdata;
    
-- create new blank column in existing table.
alter table walmartdata 
add column time_of_day varchar(20);

-- adding values to blank column time of day column.
UPDATE walmartdata 
SET 
    time_of_day = (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);
    
/* 2. Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
This will help answer the question on which week of the day each branch is busiest. */

-- first we will have to change format of date column and change the datatype
UPDATE walmartdata
SET date = STR_TO_DATE(date, '%d-%m-%Y');

ALTER TABLE walmartdata
MODIFY COLUMN date DATETIME;
 
-- this query gives us day of the week which we will insert in our table
SELECT
date,
    DAYNAME(date) AS day_name
FROM
    walmartdata;
    
-- now we will create new column day_name indicating day of the week.
alter table walmartdata 
add column day_name varchar(20);

-- adding values to blank column day name column.
UPDATE walmartdata 
SET day_name = (DAYNAME(date));

/* 3. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). 
Help determine which month of the year has the most sales and profit. */

-- use same procedure to create new column for months.
SELECT 
    date, MONTHNAME(date)
FROM
    walmartdata;

ALTER table walmartdata
add column month_name varchar(20);

UPDATE walmartdata 
SET 
    month_name = (MONTHNAME(date));