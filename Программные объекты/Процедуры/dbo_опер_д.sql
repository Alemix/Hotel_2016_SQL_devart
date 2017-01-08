SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[опер_д]
(
	@опер_код int
	
)
AS
	SET NOCOUNT OFF;

DELETE FROM [нач] WHERE ([опер_код] = @опер_код) 
DELETE FROM [опер] WHERE ([опер_код] = @опер_код)
GO