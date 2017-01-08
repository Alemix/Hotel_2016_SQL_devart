SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[пара_д]
(
	@original_комп_код int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [пара] WHERE (([комп_код] = @Original_комп_код))
GO