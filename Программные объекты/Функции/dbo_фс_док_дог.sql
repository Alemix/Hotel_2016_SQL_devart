SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фс_док_дог] (
-- Add the parameters for the function here
@хоз_код INT,
@дог_вид_код INT
)
RETURNS INT
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @док INT

   SELECT
     @док = Isnull(MAX(дог_ном), 0) + 1
   FROM
     дог
   WHERE  ( Isnull(дог_хоз, 0) = @хоз_код
            AND Isnull(дог_вид_код, 0) = @дог_вид_код )
      AND YEAR(Isnull(дог_дата, CONVERT(DATE, ''))) = YEAR(Getdate()) --   номер в текущем году
       
      -- Return the result of the function
      RETURN Isnull(@док, 0)
  END 

/* Так было до нового года
изменил 

1.  номер в текущем году
  SELECT @док = MAX(дог_ном) + 1
      FROM   дог
      WHERE  ( дог_хоз = @хоз_код and  дог_вид_код = @дог_вид_код)
*/
GO