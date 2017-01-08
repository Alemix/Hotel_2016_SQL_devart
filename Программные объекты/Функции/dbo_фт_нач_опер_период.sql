﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		МАГ
-- Create date: 2017/01/01
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_нач_опер_период] (
	-- Add the parameters for the function here
	@дата_с DATE
	, @дата_по DATE
	)
RETURNS TABLE
AS
RETURN (
		-- Add the SELECT statement with parameter references here
		SELECT 
		 min(DISTINCT нач.дата) AS дата_min
		, MAX(DISTINCT нач.дата) AS дата_max
			
			, MAX(DISTINCT YEAR(нач.дата)) AS д_год
			, MAX(DISTINCT MONTH(нач.дата)) AS д_мес
			, SUM(нач.нач_сум) AS нач_сум
			, SUM(нач.ски_сум) AS ски_сум
			, опер.опер_код
			
			, SUM(нач.сут) AS сут_Период
			, MAX(опер.сут) AS сут_Всего
			, MAX(опер.кол_взр) AS кол_взр
			, MAX(опер.кол_дет) AS кол_дет
			, ( MAX(опер.кол_взр) + MAX(опер.кол_дет)) AS кол,
			( MAX(опер.кол_взр) + MAX(опер.кол_дет)) * SUM(нач.сут) as койко_суток
		FROM нач
		INNER JOIN опер
			ON нач.опер_код = опер.опер_код
		WHERE (нач.дата >= @Дата_с)
			AND (нач.дата <= @Дата_по)
		GROUP BY опер.опер_код
		)
GO