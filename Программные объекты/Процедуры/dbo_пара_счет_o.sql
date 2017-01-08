SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[пара_счет_o]
AS
  SET NOCOUNT OFF;
/* работает скалар */
 
 SELECT счет_код
  FROM   пара
  where комп_код = 1
  
  
  /* не заработало - ставил Non query
  DECLARE @счет_код INT;

  SELECT @счет_код = счет_код
  FROM   пара
  where комп_код = 1

  RETURN @счет_код */
GO