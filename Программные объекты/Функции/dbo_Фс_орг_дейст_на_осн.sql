SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
create  FUNCTION [dbo].[Фс_орг_дейст_на_осн] (
-- Add the parameters for the function here
@орг_код INT)
RETURNS VARCHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @имя VARCHAR(300)

      SELECT
        @имя = CASE
                 WHEN Isnull(орг.дейст_на_осн, '') <> '' THEN Rtrim(орг.дейст_на_осн)
                 ELSE 'устава'
               END
      FROM
        dbo.орг
      WHERE  орг.орг_код = @орг_код

      -- надо в SELECT  rtrim(dbo.Фс_преамбула (208))
      -- rtrim не работает !!!
      RETURN Rtrim(@имя)
  END
GO