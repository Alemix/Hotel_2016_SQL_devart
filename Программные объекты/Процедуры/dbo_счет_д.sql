SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[счет_д] (@счет_код INT)
AS
  SET NOCOUNT OFF;

  DELETE FROM [счет]
  WHERE  [счет_код] = @счет_код
GO