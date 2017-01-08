SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[Фс_бар_тов_цена] (
-- Add the parameters for the function here
@тов_код INT,
@дата    DATE)
RETURNS DECIMAL(9, 0)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @цена DECIMAL(9, 0)
      DECLARE @цена_дата DATE

      SELECT @цена_дата = MAX(дата)
      FROM   бар_цена
      WHERE  дата <= @дата and тов_код = @тов_код

      SELECT @цена = цена
      FROM   бар_цена
      WHERE  дата = @цена_дата and тов_код = @тов_код

      -- Return the result of the function
      RETURN Isnull(@цена, 0)
  END
GO