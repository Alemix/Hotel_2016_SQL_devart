SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_фам_ио] (
-- Add the parameters for the function here
@кли_код INT)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      
      DECLARE @фио CHAR(70)
SELECT @фио = Rtrim(Isnull(кли.фам, '')) + ' '
	 +  upper(LEFT(Isnull(кли.имя, ''), 1)) + '. ' 
	 + CASE
	 WHEN Isnull(кли.отч, '') = '' THEN ''
	 ELSE upper(LEFT(Isnull(кли.отч, ''), 1)) + '.'
	 END

FROM   кли
WHERE  ( кли_код = @кли_код ) 



      -- Return the result of the function
      RETURN @фио
  END
GO