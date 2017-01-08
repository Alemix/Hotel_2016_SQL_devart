SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Баланс_оплату]
-- Add the parameters for the stored procedure here
@счет_код INT
AS
  BEGIN
      DECLARE @бал_сум BIGINT;

      SELECT
        @бал_сум = Isnull(бал_сум, 0)
      FROM
        dbo.Фт_нач_опл_сум(@счет_код) AS Фт_нач_опл_сум_1
  END

IF @бал_сум <> 0
  BEGIN
      INSERT INTO опл
                  (счет_код,
                   дата,
                   опл_сум,
                   опл_вид_код,
                   инф_опл)
      VALUES      (@счет_код,
                   Getdate(),
                   @бал_сум,
                   1,
                   'Баланс' )
  END

RETURN @бал_сум
GO