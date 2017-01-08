SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	Ноль впереди числа
-- =============================================
CREATE  FUNCTION [dbo].[фс_ном_имя] (
-- Add the parameters for the function here
@ном_код int 
)
RETURNS CHAR(50)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @н CHAR(50)
  
  SELECT @н = 
   CAST(ном.НОМ AS CHAR(3)) + ' ' 
   + Rtrim(ном_тип.тип_имя) + ' (' + CAST(ном.мест AS CHAR(1)) + '/' + CAST(ном.мест AS CHAR(1)) + CASE Isnull(ном.кур, 0)
    WHEN 0 THEN ')'
    WHEN 1 THEN ') Кур.'
                                                                                                                                      END
 FROM
   ном
 LEFT OUTER JOIN ном_тип
   ON ном.тип_код = ном_тип.тип_код
 WHERE           ном_код = @ном_код 
 
      RETURN @н
  END
GO