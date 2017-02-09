  select top 100 * from Production.TransactionHistory
  select count((ProductID)) from Production.TransactionHistory
  select count(distinct(ProductID)) from Production.TransactionHistory
  select count(distinct(ModifiedDate)) from Production.TransactionHistory


  select distinct(TransactionDate) from Production.TransactionHistory


  --Creating temporary table for Count of items published each day
--DROP TABLE #temp_item_id

select TransactionDate, count(ReferenceOrderID) as count_id 
--INTO #temp_item_id
FROM Production.TransactionHistory
WHERE YEAR(TransactionDate)='2008'
GROUP BY TransactionDate
ORDER BY TransactionDate


SELECT * FROM #temp_item_id

--Finding the total sum of items created in the last 30 days
SELECT a.TransactionDate as 'Day' , SUM(b.count_id)  as 'Stock'
FROM #temp_item_id a, #temp_item_id b
WHERE b.TransactionDate < a.TransactionDate AND b.TransactionDate > a.TransactionDate - 30
GROUP BY a.TransactionDate
ORDER BY a.TransactionDate DESC