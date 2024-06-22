
-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- imported data into mysql from csv file
select * from walmartdata;

-- modified datatypes of the columns of the table
ALTER TABLE walmartdata
    MODIFY COLUMN invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    MODIFY COLUMN branch VARCHAR(5) NOT NULL,
    MODIFY COLUMN city VARCHAR(30) NOT NULL,
    MODIFY COLUMN customer_type VARCHAR(30) NOT NULL,
    MODIFY COLUMN gender VARCHAR(30) NOT NULL,
    MODIFY COLUMN product_line VARCHAR(100) NOT NULL,
    MODIFY COLUMN unit_price DECIMAL(10, 2) NOT NULL,
    MODIFY COLUMN quantity INT NOT NULL,
    MODIFY COLUMN total DECIMAL(12, 4) NOT NULL,
    MODIFY COLUMN time TIME NOT NULL,
    MODIFY COLUMN payment VARCHAR(15) NOT NULL,
    MODIFY COLUMN cogs DECIMAL(10, 2) NOT NULL,
    MODIFY COLUMN gross_margin_percentage FLOAT(11, 9),
    MODIFY COLUMN gross_income DECIMAL(12, 4),
    MODIFY COLUMN rating FLOAT(3, 1);
    
describe walmartdata;