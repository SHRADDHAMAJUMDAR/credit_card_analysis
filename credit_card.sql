CREATE DATABASE ccdb;
-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category character varying(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num character varying(20),
    Qtr character varying(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip character varying(10),
    Exp_Type character varying(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc character varying(5)
);

select * from cc_detail;
select * from cust_detail;

-- 2. Create cc_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender character varying(5),
    Dependent_Count INT,
    Education_Level character varying(50),
    Marital_Status character varying(20),
    State_cd character varying(50),
    Zipcode character varying(20),
    Car_Owner character varying(5),
    House_Owner character varying(5),
    Personal_Loan character varying(5),
    Contact character varying(50),
    Customer_Job character varying(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 3. Copy csv data into SQL (remember to update the file name and file location in below query)

-- copy cc_detail table



-- copy cust_detail table

COPY cust_detail
FROM 'D:\SHRADDHA\analyst\Credit_Card_Dashboard\customer.csv' 
DELIMITER ',' 
CSV HEADER;



-- If you are getting below error, then use the below point:  
   -- ERROR:  date/time field value out of range: "0"
   -- HINT:  Perhaps you need a different "datestyle" setting.

-- Check the Data in Your CSV File: Ensure date column values are formatted correctly and are in a valid format that PostgreSQL can recognize (e.g., YYYY-MM-DD). And correct any incorrect or missing date values in the CSV file. 
   -- or
-- Update the Datestyle Setting: Set the datestyle explicitly for your session using the following command:
SET datestyle TO 'ISO, DMY';

-- Now, try to COPY the csv files!


-- 4. Insert additional data into SQL, using same COPY function

-- copy additional data (week-53) in cc_detail table

SELECT DATE_FORMAT(Week_Start_Date, '%d/%m/%Y') AS formatted_date FROM cc_detail;


COPY cc_detail
FROM 'D:\SHRADDHA\analyst\Credit_Card_Dashboard\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;


-- copy additional data (week-53) in cust_detail table (remember to update the file name and file location in below query)

COPY cust_detail
FROM 'D:\SHRADDHA\analyst\Credit_Card_Dashboard\cust_add.csv' 
DELIMITER ',' 




