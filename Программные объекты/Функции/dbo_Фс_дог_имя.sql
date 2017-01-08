SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_дог_имя] (
-- Add the parameters for the function here
@дог_код INT)
RETURNS VARCHAR(100)
AS
  BEGIN
      DECLARE @дог_имя VARCHAR(100);

      IF Isnull(@дог_код, 0) = 0
        SET @дог_имя = ''
      ELSE
        BEGIN
            SELECT
              @дог_имя = CASE
                           WHEN Isnull(дог.дог_ном, '') = '' THEN 'б/н'
                           ELSE Rtrim(CONVERT(VARCHAR, Isnull(дог.дог_ном, '')))
                         END + ' от ' + CASE
                                          WHEN Isnull(дог.дог_дата, '') = '' THEN 'нет даты'
                                          ELSE Rtrim(CONVERT(VARCHAR, Isnull(дог.дог_дата, ''), 104))
                                        END + '  хоз: ' + Rtrim(Isnull(орг_хоз.орг_имя, '')) + ' вид: ' 
                                        + LEFT (Isnull(дог_вид.дог_вид_имя, ''), 5) 
                                        + '   к' + Rtrim(CONVERT(VARCHAR, Isnull(дог.дог_код, ''))) + ''
            FROM
              дог_вид
            RIGHT OUTER JOIN дог
                             LEFT OUTER JOIN орг_хоз
                               ON дог.дог_хоз = орг_хоз.орг_код
                             LEFT OUTER JOIN орг
                               ON дог.дог_орг = орг.орг_код
              ON дог_вид.дог_вид_код = дог.дог_вид_код
            WHERE            дог_код = @дог_код
        END

      RETURN Isnull (@дог_имя, '')
  END
GO