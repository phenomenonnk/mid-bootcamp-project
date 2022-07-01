# SQL questions - regression

/*(Use sub queries or views wherever necessary)

1. Create a database called `house_price_regression`.

2. Create a table `house_price_data` with the same columns as given in the csv file. Please make sure you use the correct data types for the columns. You can find the names of the headers for the table in the `regression_data.xls` file. Use the same column names as the names in the excel file. Please make sure you use the correct data types for each of the columns.

# ATENTION: it is easier to use the Data Import Wizard instead of step 3.
3. Import the data from a csv file into the table (save the excel file as csv). Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. (in this case we have already deleted the header names from the csv files).  To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:
Already done till question 3*/

use house_price_regression;

-- 4.  Select all the data from table `house_price_data` to check if the data was imported correctly
select * from house_price_regression.regression_data;

-- 5. Use the alter table command to drop the column `date` from the database, as we would not use it in the analysis with SQL.
-- Select all the data from the table to verify if the command worked.
-- Limit your returned results to 10.
alter table house_price_regression.regression_data
drop column date;

select * from house_price_regression.regression_data
limit 10;


-- 6. Use sql query to find how many rows of data you have.
select count(id) as number_of_rows from house_price_regression.regression_data;

-- 7.  Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column `bedrooms`?
select distinct bedrooms as unique_values_of_bedrooms from house_price_regression.regression_data;

-- What are the unique values in the column `bathrooms`?
select distinct bathrooms as unique_values_of_bathrooms from house_price_regression.regression_data;

-- What are the unique values in the column `floors`?
select distinct(floors) as unique_values_of_floors from house_price_regression.regression_data;

-- What are the unique values in the column `condition`?
select distinct ('condition') as unique_values_of_condition from house_price_regression.regression_data;

-- What are the unique values in the column `grade`?
select distinct(grade) as unique_values_of_grade from house_price_regression.regression_data;

-- 8. Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
select id, price from house_price_regression.regression_data
order by price desc
limit 10;

-- 9.  What is the average price of all the properties in your data?
select avg(price) from house_price_regression.regression_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data

-- What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices.
-- Use an alias to change the name of the second column.
select bedrooms, avg(price) as average_price from house_price_regression.regression_data
group by bedrooms;
  
-- What is the average `sqft_living` of the houses grouped by bedrooms?
-- The returned result should have only two columns, bedrooms and Average of the `sqft_living`.
-- Use an alias to change the name of the second column.
select bedrooms, round(avg(sqft_living),2) as average_sqft_living from house_price_regression.regression_data
group by bedrooms;

-- What is the average price of the houses with a waterfront and without a waterfront?
-- The returned result should have only two columns, waterfront and `Average` of the prices. 
-- Use an alias to change the name of the second column.
select waterfront, round(avg(price),2) as average_price from house_price_regression.regression_data
group by waterfront; 
    
-- Is there any correlation between the columns `condition` and `grade`?
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
select `condition`, avg(grade) as average_grade
from house_price_regression.regression_data
group by `condition`
order by `condition`;
-- We could notice that there is a relationship between condition and average_grade, when condition increases then average_grade invreases, too.
-- Seems that are proportional amounts
-- We could say that we have positive correlation if we have a well presented dataset (with a lot of observations)

-- You might also have to check the number of houses in each category (ie number of houses for a given `condition`)
-- to assess if that category is well represented in the dataset to include it in your analysis.
-- For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis
select `condition`, avg(grade) as average_grade, count(id) as quantity_of_houses
from house_price_regression.regression_data
group by `condition`
order by `condition`;
-- we notice that the amount of houses in condition 1 is only 24 (or in condition 2=154) on the other hand the amount of houses in condition 3 is 13033.
-- there are high differences between the amounts, so we don't have a well presented dataset and we cannot say that there is a 
-- positive correlation between condition and average_grade

-- 11. One of the customers is only interested in the following houses:
-- Number of bedrooms either 3 or 4
-- Bathrooms more than 3
-- One Floor
-- No waterfront
-- Condition should be 3 at least
-- Grade should be 5 at least
-- Price less than 300000
-- For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?
select * from house_price_regression.regression_data
where bedrooms in (3, 4) and bathrooms > 3 and floors = 1 and waterfront = 0 and `condition` >= 3 and grade >= 5 and price < 300000;
-- There are no obcervations-returned rows with these criteria

-- 12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database.
-- Write a query to show them the list of such properties. You might need to use a sub query for this problem.
select avg(price)*2 from house_price_regression.regression_data; -- getting the double price of the average price
select * from house_price_regression.regression_data
where price > (select avg(price)*2 from house_price_regression.regression_data);

-- 13. Since this is something that the senior management is regularly interested in,
-- create a view called `Houses_with_higher_than_double_average_price` of the same query.
create view Houses_with_higher_than_double_average_price as
select * from house_price_regression.regression_data
where price > (select avg(price)*2 from house_price_regression.regression_data);

-- 14. Most customers are interested in properties with three or four bedrooms.
-- What is the difference in average prices of the properties with three and four bedrooms?
-- In this case you can simply use a group by to check the prices for those particular houses
select bedrooms, avg(price) from house_price_regression.regression_data
where bedrooms in (3,4)
group by bedrooms; 

-- 15. What are the different locations where properties are available in your database? (distinct zip codes)
select distinct(zipcode) from house_price_regression.regression_data;

-- 16. Show the list of all the properties that were renovated.
select id, yr_renovated from house_price_regression.regression_data
where yr_renovated != 0;

-- 17. Provide the details of the property that is the 11th most expensive property in your database.
select * from house_price_regression.regression_data
order by price desc 
limit 10,1;