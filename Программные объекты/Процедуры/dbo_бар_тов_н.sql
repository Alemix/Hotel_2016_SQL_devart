SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_тов_н] (@тов_имя CHAR(30),
                                   @тов_вид     CHAR(20))
AS
  SET NOCOUNT OFF;

  INSERT INTO [бар_тов]
              ([тов_имя],
               [тов_вид])
  VALUES      (@тов_имя,
               @тов_вид);

 SELECT
   тов_код,
   тов,
   тов_вид,
   тов_имя
 FROM
   бар_тов 
  WHERE  ( тов_код = Scope_identity() )
GO