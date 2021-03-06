﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_счет_имя] (
-- Add the parameters for the function here
@счет_код INT)
RETURNS CHAR(100)
AS
  BEGIN
    
     DECLARE @счет_имя  CHAR(100)
      SELECT @счет_имя = 
      
      Rtrim(Isnull(счет.счет_имя, '')) 
      + '   ( сч.N ' + 

 CASE 
	  WHEN Isnull(счет.док, '') = '' THEN 'б/н'
	  ELSE Rtrim(CONVERT(VARCHAR, Isnull(счет.док, '')))
END +

 + ' от ' + 

 + CASE
	 WHEN Isnull(счет.дата, '') = '' THEN 'нет даты'
	 ELSE Rtrim(CONVERT(VARCHAR, Isnull(счет.дата, ''), 104))
	 END 

+ ' ) ' + 
Rtrim(Isnull(орг_хоз.орг_имя, '')) 
FROM   орг_хоз
       RIGHT OUTER JOIN счет
         ON орг_хоз.орг_код = счет.орг_хоз_код
      WHERE  ( счет_код = @счет_код )

      RETURN  @счет_имя
  END
GO