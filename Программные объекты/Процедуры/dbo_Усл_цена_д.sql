SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Усл_цена_д] (@усл_цена_код    INT)
AS
  SET NOCOUNT ON;

  DELETE усл_цена
  WHERE  усл_цена_код= @усл_цена_код
GO