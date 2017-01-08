SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фс_док] (
-- Add the parameters for the function here
@орг_хоз_код INT)
RETURNS INT
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @док INT

      SELECT
        @док = Isnull(MAX(док), 0) + 1
      FROM
        счет
      WHERE  ( Isnull(орг_хоз_код, 0) = @орг_хоз_код )
         AND YEAR(Isnull(дата, CONVERT(DATE, ''))) = YEAR(Getdate()) --   номер в текущем году

      -- Return the result of the function
      RETURN Isnull(@док, 0)
  END
/* Так было до нового года
изменил 

1.  номер в текущем году

 SELECT @док = MAX(док) + 1
      FROM   счет
      WHERE  ( орг_хоз_код = @орг_хоз_код )
      */
GO