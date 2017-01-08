SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[бар_ост_д]
(
	@ост_код int
	)
AS
	SET NOCOUNT OFF;
DELETE FROM [бар_ост] WHERE ([ост_код] = @ост_код)
GO