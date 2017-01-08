SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_преамбула_дог] (
-- Add the parameters for the function here
@дог_код INT)
RETURNS CHAR(1000)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @пре VARCHAR(MAX)
      DECLARE @исп VARCHAR(MAX)
      DECLARE @зак VARCHAR(MAX)
DECLARE @орг_код int 

      SELECT
        @исп = Rtrim(CONVERT(VARCHAR(MAX), Isnull(орг_хоз.преамбула, '')))
      FROM
        dbo.дог
      LEFT OUTER JOIN dbo.орг_хоз
        ON dbo.дог.дог_хоз = dbo.орг_хоз.орг_код
      WHERE           дог.дог_код = @дог_код

      SELECT
        @орг_код = дог.дог_орг
      FROM
        dbo.дог
      WHERE   дог.дог_код = @дог_код

      SELECT
        @зак = dbo.Фс_преамбула_орг(@орг_код)

      SELECT
        @пре = Space(5) + Rtrim(@исп) + ', с одной стороны и ' + Rtrim(@зак) 
        + ' с другой стороны, '
-- 2012 08 13 дополнеия
+ 'заключили настоящий договор о нижеследующем: '

      -- надо в SELECT  rtrim(dbo.Фс_преамбула (208))
      -- кекшь не работает !!!
      RETURN Rtrim(@пре)
  END
GO