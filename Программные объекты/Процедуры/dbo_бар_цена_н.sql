SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_цена_н]
(
	@дата date,
	@цена numeric(9, 0),
	@тов_код int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [бар_цена] ([дата], [цена], [тов_код]) VALUES (@дата, @цена, @тов_код)
GO