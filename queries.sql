-- 1. Total sales and profit by category
SELECT 
  Category,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM `Sample - Superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 2. Profit margin by category
SELECT 
  Category,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct
FROM `Sample - Superstore`
GROUP BY Category
ORDER BY Profit_Margin_Pct DESC;

-- 3. Average discount by category
SELECT 
  Category,
  ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Pct,
  ROUND(SUM(Profit), 2) AS Total_Profit
FROM `Sample - Superstore`
GROUP BY Category
ORDER BY Avg_Discount_Pct DESC;

-- 4. Furniture sub-category deep dive
SELECT 
  Category,
  `Sub-Category`,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct,
  ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Pct
FROM `Sample - Superstore`
WHERE Category = 'Furniture'
GROUP BY `Sub-Category`
ORDER BY Profit_Margin_Pct ASC;

-- 5. Regional performance analysis
SELECT 
  Region,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct,
  COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM `Sample - Superstore`
GROUP BY Region
ORDER BY Total_Profit DESC;
