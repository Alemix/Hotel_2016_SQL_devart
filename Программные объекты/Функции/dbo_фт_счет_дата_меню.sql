SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_счет_дата_меню] (
-- Add the parameters for the function here
@дата        DATE,
@орг_хоз_код INT,
@тип_код     INT)
RETURNS TABLE
AS
  RETURN
    (SELECT
       DISTINCT
       счет.счет_код,
         Rtrim(dbo.Фс_счет_имя(счет.счет_код)) 
       + Rtrim(dbo.Фс_дог_имя_кор(счет.дог_код)) 
       + Rtrim(dbo.Фс_счф_имя_кор(счет.счф_код)) 
       + ' код= '+rtrim(convert(char(10),счет.счет_код))
       
       AS счет_меню
     FROM
       счет
     RIGHT OUTER JOIN dbo.Фт_мест_дата_з_глав(@дата) AS Фт_мест_дата_з_глав_1
       ON счет.счет_код = Фт_мест_дата_з_глав_1.счет_код
     LEFT OUTER JOIN  орг_хоз
       ON счет.орг_хоз_код = орг_хоз.орг_код
     WHERE            ( счет.счет_код IS NOT NULL
                    AND Isnull(счет.орг_хоз_код, 1) = @орг_хоз_код
                    AND Isnull(счет.тип_код, 1) = @тип_код )
                    
                  
                    )
GO