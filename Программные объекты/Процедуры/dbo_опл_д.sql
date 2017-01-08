SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[опл_д]
(
	@опл_код int
	
)
AS
	SET NOCOUNT OFF;
DELETE FROM [опл] WHERE ([опл_код] = @опл_код)
GO