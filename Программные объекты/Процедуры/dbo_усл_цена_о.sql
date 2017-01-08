SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[усл_цена_о]

AS
	SET NOCOUNT ON;
SELECT   усл_цена_код, усл_код, усл_дата_с, тип_код, цена_1, цена_2, цена_3, цена_7
FROM         усл_цена
ORDER BY усл_код, усл_дата_с, тип_код
GO