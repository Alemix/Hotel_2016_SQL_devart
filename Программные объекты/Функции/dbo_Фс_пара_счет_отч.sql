SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_пара_счет_отч]
(
  -- Add the parameters for the function here
  @комп_код INT
)
RETURNS INT
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @счет_код INT

      SELECT
        @счет_код = счет_код
      FROM
        пара
      WHERE  комп_код = @комп_код

      -- Return the result of the function
      RETURN @счет_код
  END
GO