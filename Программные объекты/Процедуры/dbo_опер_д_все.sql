SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROCEDURE [dbo].[опер_д_все]
(
	@опер_код int
	
)
AS
	SET NOCOUNT OFF;
DELETE FROM [опер] WHERE ([опер_код] = @опер_код)
GO