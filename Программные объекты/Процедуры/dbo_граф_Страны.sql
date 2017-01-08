SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		МАГ
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[граф_Страны]
	-- Add the parameters for the stored procedure here
	@дата_с DATE
	,@дата_по DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT стр_имя
		,COUNT(*) AS кол_зап
		,дата_зае_дата
		,гражд_код
	FROM во_жур_гр_ин
	GROUP BY стр_имя
		,дата_зае_дата
		,гражд_код
	HAVING (дата_зае_дата >= @дата_с)
		AND (дата_зае_дата <= @дата_по)
		AND (гражд_код > 1)
END
GO