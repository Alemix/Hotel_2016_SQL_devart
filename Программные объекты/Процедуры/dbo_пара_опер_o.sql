SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROCEDURE [dbo].[пара_опер_o]
AS
  SET NOCOUNT OFF;
/* работает скалар */
 
 SELECT опер_код
  FROM   пара
  where комп_код = 1
  
  
  /* не заработало - ставил Non query
  DECLARE @счет_код INT;

  SELECT @счет_код = счет_код
  FROM   пара
  where комп_код = 1

  RETURN @счет_код */
GO