SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_гра_стр]
(
  -- Add the parameters for the function here
  @кли_код INT
)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
  
      DECLARE @гра_стр CHAR(10)

      SELECT
        @гра_стр = стр.гражд
      FROM
        стр
      RIGHT OUTER JOIN кли
        ON стр.стр_код = Isnull(кли.гражд_код, 1)
      WHERE            кли_код = @кли_код

      RETURN @гра_стр
  END
/*  SELECT
        @гра_стр = гражд
      FROM
        стр
      WHERE  Isnull(стр_код, 1) = Isnull(@гражд_код, 1) */
GO