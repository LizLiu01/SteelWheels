Create View [dbo].[ProductCombinations]

AS
SELECT 
	st1.OrderNumber
	,st1.OrderDate
	,st1.ProductCode as [prodA]
	,st2.ProductCode as [prodB]
FROM [SteelWheelsDW].[dbo].[fact_orders] as st1
cross join [SteelWheelsDW].[dbo].[fact_orders] as st2
WHERE st1.OrderNumber = st2.orderNumber AND st1.ProductCode <> st2.ProductCode;

GO