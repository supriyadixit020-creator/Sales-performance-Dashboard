create database  sales_analysis
use sales_analysis


select * from [Sample-Superstore]


SELECT COUNT(*) 
FROM [Sample-Superstore]        ---------------------total Rows :- 9994



SELECT TOP 10 * 
FROM [Sample-Superstore]   -------------top 10 rows


SELECT 
     REGION,
     COUNT(ORDER_ID) AS TOTAL_ORDERS,
     ROUND(SUM(SALES), 2)AS TOTAL_SALES,                 -------TOTAL SALES, TOTAL ORDERS, TOTAL PROFIT & PROFIT MARGIN REGION WISE CALCULATED
     ROUND(SUM(PROFIT), 2) AS TOTAL_PROFIT,
     ROUND(SUM(PROFIT)/SUM(SALES)*100, 2) AS   PROFIT_MARGIN
FROM [Sample-Superstore] 
GROUP BY REGION
ORDER BY TOTAL_SALES DESC

DELETE FROM [Sample-Superstore] 
WHERE Region IS NULL


SELECT COUNT(*) 
FROM [Sample-Superstore] 

------CATEGORY WISE SALES & PROFIT


SELECT 
  CATEGORY,
  ROUND(SUM(SALES) ,2) AS TOTAL_SALES,
  ROUND(SUM(PROFIT), 2) AS TOTAL_PROFIT,
  SUM(QUANTITY) AS TOTAL_UNIT_SOLD,
  ROUND(SUM(PROFIT)/SUM(SALES)*100,2) AS PROFIT_MARGIN_PERCT
FROM [Sample-Superstore]
GROUP BY CATEGORY
ORDER BY TOTAL_SALES DESC


------MONTHLY SALES TRENDS

SELECT
      YEAR,
      MONTH(ORDER_DATE) AS MONTH_NUMBER,
      DATENAME(MONTH, ORDER_DATE) AS MONTH_NAME,
      ROUND(SUM(SALES),2) AS MONTHLY_SALES,
      ROUND(SUM(PROFIT), 2) AS MONTHLY_PROFIT
FROM [Sample-Superstore]
GROUP BY YEAR, MONTH(ORDER_DATE),DATENAME(MONTH,ORDER_DATE)
ORDER BY YEAR, MONTH_NUMBER



SELECT
    Year,
    MONTH(Order_Date) AS Month_Number,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM [Sample-Superstore]
GROUP BY Year, MONTH(Order_Date), DATENAME(MONTH, Order_Date)
ORDER BY Year, Month_Number


-----------CUSTOMER  SEGMENT ANALYSIS
SELECT 
    Segment,
    COUNT(DISTINCT Customer_Name) AS Total_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Pct
FROM [Sample-Superstore]
GROUP BY Segment
ORDER BY Total_Profit DESC