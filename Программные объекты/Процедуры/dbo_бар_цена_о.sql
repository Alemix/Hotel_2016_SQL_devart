SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_цена_о]
(
	@тов_код int
)
AS
	SET NOCOUNT ON;
SELECT     дата, цена, тов_код
FROM         бар_цена
WHERE     (тов_код = @тов_код)
GO