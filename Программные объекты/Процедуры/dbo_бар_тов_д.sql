SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_тов_д]
(
	@Original_тов_код int,
	@IsNull_тов_имя Int,
	@Original_тов_имя char(40),
	@IsNull_тов Int,
	@Original_тов char(10)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [бар_тов] WHERE (([тов_код] = @Original_тов_код) AND ((@IsNull_тов_имя = 1 AND [тов_имя] IS NULL) OR ([тов_имя] = @Original_тов_имя)) AND ((@IsNull_тов = 1 AND [тов] IS NULL) OR ([тов] = @Original_тов)))
GO