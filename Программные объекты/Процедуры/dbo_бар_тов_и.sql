SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_тов_и] (@тов_имя          CHAR(30),
                                   @тов_вид          CHAR(20),
                                   @тов_код          INT)
AS
  SET NOCOUNT OFF;

  UPDATE [бар_тов]
  SET    [тов_имя] = @тов_имя,
         [тов_вид] = @тов_вид
  WHERE  ( [тов_код] = @тов_код )
           
  SELECT
   тов_код,
   тов,
   тов_вид,
   тов_имя
 FROM
   бар_тов 
  WHERE  ( тов_код = @тов_код )
GO