SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_счф_имя] (
-- Add the parameters for the function here
@счф_код INT)
RETURNS VARCHAR(100)
AS
  BEGIN
      DECLARE @счф_имя VARCHAR(100);

      SELECT
        @счф_имя = 
         
        CASE 
			  WHEN Isnull(счф.счф_док, '') = '' THEN 'б/н'
			  ELSE Rtrim(CONVERT(VARCHAR, Isnull(счф.счф_док, '')))
        END 
        
         + ' от ' 
        + CASE
			 WHEN Isnull(счф.счф_дата, '') = '' THEN 'нет даты'
			 ELSE Rtrim(CONVERT(VARCHAR, Isnull(счф.счф_дата, ''), 104))
			 END 
        
     + ', сумма = '     
     +  Rtrim(CONVERT(VARCHAR, Isnull(счф.счф_итого, 0)))
     
      + ', ном = '   
     
     +  Rtrim(CONVERT(VARCHAR, Isnull(счф.счф_ном, 0)))
      + ', сут = '   
      
     + Rtrim(CONVERT(VARCHAR, Isnull(счф.счф_сут, 0)))

 + ' (' 
+ dbo.Фс_счф_имя_опл(счф.счф_код)
+ ')' 

    /*
		 + ' к' 
		 + Rtrim(CONVERT(VARCHAR, Isnull(счф.счф_код, ''))) + ''
      */
      
      
      FROM
        счф
     where  счф_код =  @счф_код

      RETURN @счф_имя
  END
GO