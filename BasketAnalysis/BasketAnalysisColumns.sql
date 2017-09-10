

Create View BasketAnalysisColumns
AS
SELECT prodA, 
prodB, 
CrossTxnCnt, 
P1.ProductCount as [prodATxnCnt],
P2.ProductCount as [prodBTxnCnt],
tot.TotTxnCnt
 FROM
(
SELECT prodA,prodB, COUNT(DISTINCT OrderNumber) as [CrossTxnCnt]
FROM
[dbo].[ProductCombinations]
GROUP BY prodA,prodB
) PC
INNER JOIN
[dbo].[TotalProductCount] P1 ON PC.prodA = P1.ProductCode
INNER JOIN
[dbo].[TotalProductCount] P2 ON PC.prodB = P2.ProductCode
CROSS JOIN
(
	SELECT COUNT(DISTINCT OrderNumber) as [TotTxnCnt] FROM fact_orders
) tot

GO