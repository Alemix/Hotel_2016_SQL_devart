SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[опл_о] @счет_код int
AS
	SET NOCOUNT ON;
SELECT счет_код,
       инф_опл,
       дата,
       опл_сум,
       опл_вид_код,
       опл_код
FROM   опл
WHERE  ( счет_код = @счет_код )
GO