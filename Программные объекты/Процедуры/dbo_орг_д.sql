SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[орг_д]
(
	@original_орг_код int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [орг] WHERE (([орг_код] = @Original_орг_код))
GO