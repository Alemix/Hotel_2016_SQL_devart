SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[счф_док_и] (
	@счф_док INT
	,@счф_док_пров INT
	,@счф_код INT
	)
AS
SET NOCOUNT OFF;

UPDATE [счф]
SET [счф_док] = @счф_док
	,[счф_док_пров] = @счф_док_пров
WHERE [счф_код] = @счф_код;
GO