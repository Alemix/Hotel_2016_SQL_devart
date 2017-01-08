SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_дви_н]
(
	@тов_код int,
	@дата date,
	@кол numeric(9, 0),
	@рас int,
	@при int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [бар_дви] ([тов_код], [дата], [кол], [рас], [при]) VALUES (@тов_код, @дата, @кол, @рас, @при)
GO