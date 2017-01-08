SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_орг_имя_пол] (
-- Add the parameters for the function here
@орг_код INT)
RETURNS VARCHAR(500)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @имя VARCHAR(500)

      SELECT
        @имя = CASE
                 WHEN Isnull(орг.орг_имя_пол, '') <> '' THEN Rtrim(орг.орг_имя_пол)
                 ELSE dbo.Фс_орг_имя_кор(@орг_код)
               END
      FROM
        dbo.орг
      WHERE  орг.орг_код = @орг_код

      -- надо в SELECT  rtrim(dbo.Фс_преамбула (208))
      -- rtrim не работает !!!
      RETURN Rtrim(@имя)
  END
GO