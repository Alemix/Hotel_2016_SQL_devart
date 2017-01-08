SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_счет_дата_меню_был_ОК]
(
  -- Add the parameters for the function here
  @дата DATE
)
RETURNS TABLE
AS
  RETURN
    (SELECT           DISTINCT
       счет.счет_код,
       Rtrim(счет.счет_имя) + ' ' + CASE
                                      WHEN Isnull(счет.док, 0) = 0 THEN ''
                                      ELSE ' - ' + Rtrim(орг_хоз.орг_имя) + ' ' + '№ ' + Rtrim(CONVERT(CHAR, счет.док)) + ' от ' + Rtrim(CONVERT(CHAR, счет.дата, 104))
                                    END + ' (' + Rtrim(CONVERT(CHAR, счет.счет_код)) + ')' AS счет_меню
     FROM
       счет
     RIGHT OUTER JOIN dbo.Фт_мест_дата_з_глав(@дата) AS Фт_мест_дата_з_глав_1
       ON счет.счет_код = Фт_мест_дата_з_глав_1.счет_код
     LEFT OUTER JOIN  орг_хоз
       ON счет.орг_хоз_код = орг_хоз.орг_код
       WHERE 
       счет.счет_код  IS NOT NULL
       
       )
GO