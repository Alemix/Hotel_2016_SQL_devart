SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[опл_и] (@счет_код             INT,
                               @опл_код             INT,
                               @инф_опл              TEXT,
                               @дата                 DATE,
                               @опл_сум                numeric(12,2),
                               @опл_вид_код          INT
                              )
AS
  SET NOCOUNT OFF;

  UPDATE [опл]
  SET   [инф_опл] = @инф_опл,
         [дата] = @дата,
         [опл_сум] = @опл_сум,
         [опл_вид_код] = @опл_вид_код
  WHERE  ([опл_код] = @опл_код )
           ;
/*
  SELECT счет_код,
       инф_опл,
       дата,
       опл_сум,
       опл_вид_код,
       опл_код
FROM   опл
WHERE  ( счет_код = @счет_код ) 
*/
GO