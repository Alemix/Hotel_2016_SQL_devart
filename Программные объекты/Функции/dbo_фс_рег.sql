SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фс_рег] (
-- Add the parameters for the function here
@гражд_код INT)
RETURNS INT
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @рег INT

      IF @гражд_код = 1 -- гражд РБ
        SELECT
          @рег = Isnull(MAX(Isnull(опер.рег, 0)), 0) + 1
        FROM
          опер
        LEFT OUTER JOIN кли
          ON опер.кли_код = кли.кли_код
        WHERE           ( Isnull(кли.гражд_код, 0) = 1 )
                    AND YEAR(дата_зае) = YEAR(Getdate()) -- только текущий год 
      ELSE
        SELECT
          @рег = Isnull(MAX(Isnull(опер.рег, 0)), 0) + 1
        FROM
          опер
        LEFT OUTER JOIN кли
          ON опер.кли_код = кли.кли_код
        WHERE           ( Isnull(кли.гражд_код, 0) != 1 )
                    AND YEAR(дата_зае) = YEAR(Getdate()) -- только текущий год 
      -- Return the result of the function
      RETURN Isnull(@рег, 0)
  END
/* Так было до нового года
изменил 
1.  код по опер (могут удалять из опер и коды не последовательны)
2.  номер в текущем году


 IF @гражд_код = 1 -- гражд РБ
        SELECT @рег =  MAX(Isnull(рег,0)) + 1
        FROM   кли
        WHERE  ( Isnull(гражд_код, 0) = 1 )
      ELSE
        SELECT @рег = MAX(Isnull(рег,0)) + 1
        FROM   кли
        WHERE  ( Isnull(гражд_код, 0) != 1 )
*/
GO