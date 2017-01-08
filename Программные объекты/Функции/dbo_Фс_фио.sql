SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_фио] (
-- Add the parameters for the function here
@кли_код INT)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      
      DECLARE @фио CHAR(70)

      SELECT @фио= 
      
      Rtrim(isnull(кли.фам,'')) + ' '
                  + Rtrim(isnull(кли.имя,''))+ ' '
                  + Rtrim(isnull(кли.отч,'')) 
      FROM   кли
      WHERE  ( кли_код = @кли_код )


      -- Return the result of the function
      RETURN @фио
  END
GO