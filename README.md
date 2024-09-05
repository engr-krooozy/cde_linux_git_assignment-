This project demonstrates a simple ETL (Extract, Transform, Load) process using Bash scripting and PostgreSQL for analyzing competitor data. The pipeline extracts data from a CSV file, transforms it, loads it into a PostgreSQL database, and then runs SQL queries to answer business questions. 

## Architecture Diagram

![image](https://github.com/user-attachments/assets/db0db3a6-5dd2-4b8e-ba4a-2fa15165406c)


## ETL Process

The ETL pipeline consists of the following steps:

1. **Extract:**
   - A Bash script  downloads a CSV file containing CO2 emissions data 

2. **Transform:**
   - The script then renames the `Variable_code` column to `variable_code`.
   - It selects only the `year`, `Value`, `Units`, and `variable_code` columns.
   - The transformed data is saved to a new CSV file named `2023_year_finance.csv` in the `transformed` directory.

3. **Load:**
   - The transformed data is copied into the `gold` directory, representing the final data storage.

**Cron Job Scheduling:**

The ETL script is scheduled to run daily at 12:00 AM using a cron job. 

## Data Loading and SQL Queries

1. **PostgreSQL Database Setup:**
   - A Bash script creates a PostgreSQL database named `posey`.
   - The CSV file containing Parch and Posey order data (downloaded separately) is loaded into the `orders` table in the `posey` database.

2. **SQL Queries:**
   - The following SQL queries are used to analyze the competitor data (found in the `Scripts/SQL/queries.sql` file):

     **Query 1: Order IDs with High Quantity**
     ```sql
     SELECT id
     FROM orders
     WHERE gloss_qty > 4000 OR poster_qty > 4000;
     ```
     This query finds a list of order IDs where either the quantity of gloss or posters is greater than 4000.

     **Query 2: Orders with Zero Standard Quantity and High Gloss/Poster Quantity**
     ```sql
     SELECT *
     FROM orders
     WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
     ```
     This query returns a list of orders where the standard quantity is zero, but either the gloss quantity or poster quantity is over 1000.

     **Query 3: Company Names with Specific Criteria**
     ```sql
     SELECT company_name
     FROM customers
     WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
       AND (primary_contact LIKE '%ana%' OR primary_contact LIKE '%Ana%')
       AND primary_contact NOT LIKE '%eana%';
     ```
     This query retrieves all company names that start with 'C' or 'W', and where the primary contact contains "ana" (case-insensitive) but does not contain "eana".

     **Query 4: Region, Sales Rep, and Account Information**
     ```sql
     SELECT r.name AS region_name,
            s.name AS sales_rep_name,
            a.name AS account_name
     FROM region AS r
     JOIN sales_reps AS s ON r.id = s.region_id
     JOIN accounts AS a ON s.id = a.sales_rep_id
     ORDER BY account_name ASC;
     ```
     This query provides a table showing the region for each sales representative, along with their associated accounts. The accounts are sorted alphabetically by name. 
