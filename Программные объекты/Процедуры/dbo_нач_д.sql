SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[нач_д]
(
	@нач_код int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [нач] WHERE ([нач_код] = @нач_код)
GO