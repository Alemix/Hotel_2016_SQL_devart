SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_кли_имя_срок] (
-- Add the parameters for the function here
@счет_код INT,
@кли_код INT
)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
    
      DECLARE @дата_зае DATE
      DECLARE @дата_вые DATE
      DECLARE @сут NUMERIC(4, 1)
      DECLARE @фио CHAR(70)
  

      DECLARE @кли_имя CHAR(100) -- возврат

    SELECT
      @дата_зае = MIN(convert(date,дата_зае)),
      @дата_вые = MAX(convert(date,дата_вые)),
      @сут = SUM(сут)
    FROM
      опер
    WHERE  счет_код = @счет_код
           AND кли_код = @кли_код 
    
SELECT 
@фио = dbo.Фс_фио(@кли_код)


set @кли_имя = 

rtrim(isnull(@фио,'') ) + ' с '+
rtrim(convert (char,isnull(@дата_зае,''),4))  + ' по '+ 
rtrim(convert (char,isnull(@дата_вые,''),4))  + ' = '+ 
rtrim(cast(isnull(@сут,0) as char(12)))  + ' сут.'  


/*rtrim(cast(isnull(@опер_код,0) as char(12)))  + ')'*/

      -- Return the result of the function
      RETURN @кли_имя 
  END
GO