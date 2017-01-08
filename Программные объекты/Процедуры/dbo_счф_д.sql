SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[счф_д] (@счф_код INT)
AS
  SET NOCOUNT OFF;

  DELETE FROM [счф]
  WHERE   [счф_код] = @счф_код
GO