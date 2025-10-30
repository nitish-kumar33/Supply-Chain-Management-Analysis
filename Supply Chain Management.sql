-----drop table
DROP TABLE IF EXISTS supply_chain CASCADE;

----create table
CREATE TABLE supply_chain (
    Product_Type VARCHAR(50),
    SKU VARCHAR(50),
    Price DECIMAL(10,2),
    Availability VARCHAR(20),
    Number_of_Products_Sold INT,
    Revenue_generated DECIMAL(10,2),
    Customer_Demographics VARCHAR(50),
    Stock_Levels INT,
    Lead_Times INT,
    Order_Quantities INT,
    Shipping_Times INT,
    Shipping_Carriers VARCHAR(50),
    Shipping_Costs DECIMAL(50,2),
    Supplier_Name VARCHAR(50),
    Location VARCHAR(50),
	Lead_Time INT,
    Production_Volumes INT,
    Manufacturing_Lead_Time INT,
    Manufacturing_Costs DECIMAL(50,2),
    Inspection_Results VARCHAR(20),
    Defect_Rates DECIMAL(5,2),
    Transportation_Modes VARCHAR(30),
    Routes VARCHAR(100),
	costs INT
);

----alter table
ALTER TABLE supply_chain
ALTER COLUMN costs TYPE DECIMAL(50,2)
USING costs::DECIMAL(50,2);

----show table
select * from supply_chain;

----Check for null or missing values:
SELECT 
    COUNT(*) FILTER (WHERE Product_Type IS NULL) AS null_product_type,
    COUNT(*) FILTER (WHERE Revenue_generated IS NULL) AS null_revenue
FROM supply_chain;

----Remove invalid or incomplete records:
DELETE FROM supply_chain
WHERE Product_Type IS NULL OR Revenue_generated IS NULL;

---Clean text formatting (trim and proper case):
UPDATE supply_chain
SET Product_Type = INITCAP(TRIM(Product_Type)),
    Supplier_Name = INITCAP(TRIM(Supplier_Name)),
    Location = INITCAP(TRIM(Location));
	
---Add a new column: Profit
ALTER TABLE supply_chain ADD COLUMN Profit DECIMAL(50,2);

UPDATE supply_chain
SET Profit = Revenue_generated - (Manufacturing_Costs + Shipping_Costs);

---Add a column for Profit Margin %
ALTER TABLE supply_chain ADD COLUMN Profit_Margin DECIMAL(10,2);

UPDATE supply_chain
SET Profit_Margin = ROUND((Profit / Revenue_generated) * 100, 2);

---Create a calculated field for Total Cost
ALTER TABLE supply_chain ADD COLUMN Total_Cost DECIMAL(50,2);

UPDATE supply_chain
SET Total_Cost = Manufacturing_Costs + Shipping_Costs + costs;

-----------------Exploratory Data Analysis (SQL Level)-----------
----Top 5 Products by Revenue:
SELECT Product_Type, SUM(Revenue_generated) AS Total_Revenue
FROM supply_chain
GROUP BY Product_Type
ORDER BY Total_Revenue DESC
LIMIT 5;

----Supplier Performance Summary:
CREATE VIEW supplier_performance AS
SELECT 
    Supplier_Name,
    ROUND(AVG(Lead_Time), 2) AS Avg_Lead_Time,
    ROUND(AVG(Manufacturing_Costs), 2) AS Avg_Manufacturing_Cost,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate,
    ROUND(SUM(Revenue_generated), 2) AS Total_Revenue
FROM supply_chain
GROUP BY Supplier_Name;

----Average Shipping Cost by Carrier:
SELECT Shipping_Carriers, ROUND(AVG(Shipping_Costs), 2) AS Avg_Shipping_Cost
FROM supply_chain
GROUP BY Shipping_Carriers
ORDER BY Avg_Shipping_Cost DESC;

-----Location-wise Profit:
SELECT Location, ROUND(SUM(Profit), 2) AS Total_Profit
FROM supply_chain
GROUP BY Location
ORDER BY Total_Profit DESC;

-----High Defect Products:
SELECT Product_Type, AVG(Defect_Rates) AS Avg_Defect
FROM supply_chain
GROUP BY Product_Type
HAVING AVG(Defect_Rates) > 2
ORDER BY Avg_Defect DESC;



























