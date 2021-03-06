/****** Script for SelectTopNRows command from SSMS  ******/
Create view BasketAnalysis
AS
	SELECT
		prodA,
		prodB,
		CAST(CAST([prodATxnCnt] AS float) / CAST([TotTxnCnt] AS float) AS decimal(6,4))*100 as SupportA,
		CAST(CAST([prodBTxnCnt] AS float) / CAST([TotTxnCnt] AS float) AS decimal(6,4))*100 as SupportB,
		CAST(CAST([CrossTxnCnt] AS float) / CAST([prodBTxnCnt] AS float) AS decimal(6,4))*100 as ConfidenceOfA,
		CAST((CAST([CrossTxnCnt] AS float)/CAST([TotTxnCnt] AS float))
		/(CAST([prodATxnCnt] AS float)/CAST([TotTxnCnt] AS float)) 
		*(CAST([prodBTxnCnt] AS float)/CAST([TotTxnCnt] AS float)) AS decimal(6,4)) *100 as Lift	
	FROM [SteelWheelsDW].[dbo].[BasketAnalysisColumns]
GO