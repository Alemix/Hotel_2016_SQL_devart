SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE VIEW [dbo].[в_пров_дог_счф_двойные]
AS
SELECT TOP (100) PERCENT дог.дог_хоз
	,счф.счф_док
	,COUNT(*) AS [счф_док_Двойные]
FROM дог
INNER JOIN счф ON дог.дог_код = счф.дог_код
WHERE (YEAR(ISNULL(счф.счф_дата, CONVERT(DATE, ''))) = YEAR(GETDATE()))
GROUP BY счф.счф_док
	,дог.дог_хоз
HAVING (COUNT(*) > 1)
ORDER BY дог.дог_хоз
	,счф.счф_док
GO