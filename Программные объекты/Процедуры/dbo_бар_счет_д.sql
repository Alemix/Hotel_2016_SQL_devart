SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create  PROCEDURE [dbo].[бар_счет_д]
(
	@дви_код int
	)
AS
	SET NOCOUNT OFF;
DELETE FROM [бар_дви] WHERE ([дви_код] = @дви_код)
GO