SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_опер_имя_без_фио] (
-- Add the parameters for the function here
@опер_код INT)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @ном_код INT
      DECLARE @кли_код INT
      DECLARE @дата_зае DATE
      DECLARE @дата_вые DATE
      DECLARE @сут NUMERIC(4, 1)
      DECLARE @фио CHAR(70)
    --  DECLARE @тип_код INT
      DECLARE @ном_имя  CHAR(30)

      DECLARE @опер_имя CHAR(100)

      SELECT @ном_код = ном_код,
             @кли_код = кли_код,
             @дата_зае = дата_зае,
             @дата_вые = дата_вые,
             @сут = isnull(сут_факт,сут)
      FROM   опер
      WHERE  ( опер_код = @опер_код )

      SELECT @ном_имя = ном_имя
      FROM   ном
      WHERE  ( ном_код = @ном_код )

      SELECT @фио = ''
      SELECT @фио = dbo.Фс_фам_ио(@кли_код )
  --  SELECT @фио = dbo.Фс_фам(@кли_код )


set @опер_имя = 
rtrim(cast(isnull(@ном_код,0) as char(10))) + ' '+ 

rtrim(isnull(@фио,'') ) + ' с '+
rtrim(convert (char,isnull(@дата_зае,''),4))  + ' по '+ 
rtrim(convert (char,isnull(@дата_вые,''),4))  + ' = '+ 
rtrim(cast(isnull(@сут,0) as char(12)))  + ' сут.' 

/*
+ ' ('+  rtrim(cast(isnull(@опер_код,0) as char(12)))  + ')'
*/

      -- Return the result of the function
      RETURN @опер_имя
  END 


/* Работало полня версия
set @опер_имя = 
rtrim(cast(isnull(@ном_код,0) as char(10))) + ' '+ 
rtrim(isnull(@ном_имя,'')) + ' '+
rtrim(isnull(@фио,'') ) + ' с '+
rtrim(cast(isnull(@дата_зае,'') as char(12))) + ' по '+ 
rtrim(cast(isnull(@дата_вые,'') as char(12))) + ' = '+ 
rtrim(cast(isnull(@сут,0) as char(12)))  + ' сут. ('+  
rtrim(cast(isnull(@опер_код,0) as char(12)))  + ')'
*/
GO