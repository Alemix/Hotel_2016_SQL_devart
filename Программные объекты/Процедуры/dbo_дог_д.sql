SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[дог_д]
(
	@дог_код int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [дог] WHERE [дог_код] = @дог_код
GO