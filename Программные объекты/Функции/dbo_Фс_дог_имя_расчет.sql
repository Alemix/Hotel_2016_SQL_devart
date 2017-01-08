SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE   FUNCTION [dbo].[Фс_дог_имя_расчет] (
-- Add the parameters for the function here
@дог_код INT)
RETURNS VARCHAR(100)
AS
  BEGIN
      DECLARE @дог_имя VARCHAR(100);

      SELECT
        @дог_имя =
     /*  ' дог. № '+ */
       
        CASE 
			  WHEN Isnull(дог.дог_ном, '') = '' THEN 'б/н'
			  ELSE Rtrim(CONVERT(VARCHAR, Isnull(дог.дог_ном, '')))
        END 
        
        + ' от ' 
        + CASE
			 WHEN Isnull(дог.дог_дата, '') = '' THEN 'нет даты'
			 ELSE Rtrim(CONVERT(VARCHAR, Isnull(дог.дог_дата, ''), 104))
			 END 
        
       
       
       /* + ' ски = '*/
       
       + ', (' 
        +  Rtrim(CONVERT(VARCHAR, Isnull(дог.дог_ски, 0))) + ''
		+ '%)'
		
      FROM
        дог_вид
      RIGHT OUTER JOIN дог
                       LEFT OUTER JOIN орг_хоз
                         ON дог.дог_хоз = орг_хоз.орг_код
                       LEFT OUTER JOIN орг
                         ON дог.дог_орг = орг.орг_код
        ON дог_вид.дог_вид_код = дог.дог_вид_код

	where дог_код = @дог_код

      RETURN isnull(@дог_имя,'')
  END
GO