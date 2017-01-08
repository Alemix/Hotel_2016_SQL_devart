SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[кли_д]
(
	@кли_код int
	
)
AS
	SET NOCOUNT OFF;
DELETE FROM [кли] WHERE ([кли_код] = @кли_код)
GO