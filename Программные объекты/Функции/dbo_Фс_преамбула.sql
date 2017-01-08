SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_преамбула] (
-- Add the parameters for the function here
@счет_код INT)
RETURNS CHAR(1000)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @пре VARCHAR(MAX)
      DECLARE @исп VARCHAR(MAX)
      DECLARE @зак VARCHAR(MAX)

      SELECT
        @исп = Rtrim(CONVERT(VARCHAR(MAX), Isnull(орг_хоз.преамбула, '')))
      FROM
        dbo.счет
      LEFT OUTER JOIN dbo.орг_хоз
        ON dbo.счет.орг_хоз_код = dbo.орг_хоз.орг_код
      WHERE           счет.счет_код = @счет_код

      SELECT
        @зак = CASE
                 WHEN Rtrim(CONVERT(VARCHAR(MAX), Isnull(орг.преамбула, ''))) <> '' THEN Rtrim(CONVERT(VARCHAR(MAX), Isnull(орг.преамбула, '')))
                 ELSE CASE
                        WHEN Isnull(орг.орг_имя_пол, '') <> '' THEN Rtrim(орг.орг_имя_пол)
                        ELSE CASE
                               WHEN Isnull(орг.орг_имя_кор, '') <> '' THEN Rtrim(орг.орг_имя_кор)
                               ELSE Isnull(орг.орг_имя, '')
                             END
                      END
               END
      FROM
        dbo.счет
      LEFT OUTER JOIN dbo.орг
        ON dbo.счет.орг_код = dbo.орг.орг_код
      WHERE           счет.счет_код = @счет_код

      SELECT
        @пре = Space(5) + Rtrim(@исп) + ', с одной стороны и ' + Rtrim(@зак)
         + 'именуемое в дальнейшем ЗАКАЗЧИК, с другой стороны, составили настоящий акт в том, что нижеперечисленные услуги выполнены ИСПОЛНИТЕЛЕМ в полном объеме. Стороны претензий не имеют.'

      -- надо в SELECT  rtrim(dbo.Фс_преамбула (208))
      -- кекшь не работает !!!
      RETURN Rtrim(@пре)
  END
GO