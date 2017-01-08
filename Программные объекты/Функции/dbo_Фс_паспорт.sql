SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_паспорт] (
-- Add the parameters for the function here
@кли_код INT)
RETURNS CHAR(300)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @пас VARCHAR(100)
      DECLARE @пас_имя VARCHAR(20)
      DECLARE @пас_выд VARCHAR(30)
      DECLARE @пас_ном VARCHAR(30)
      DECLARE @пас_дат_с VARCHAR(30)
      DECLARE @пас_дат_по VARCHAR(30)

      SELECT
        @пас_имя = Rtrim(Isnull(кли_пас_вид.пас_вид_имя, 'Паспорт')),
        @пас_ном = ' ' + CASE
                           WHEN Isnull(кли.пас_номер, '') = '' THEN ''
                           ELSE ' ' + Rtrim(Isnull(кли.пас_номер, ''))
                         END,
        @пас_выд = ' ' + CASE
                           WHEN Isnull(кли.пас_выдан, '') = '' THEN ''
                           ELSE ' выд. ' + Rtrim(Isnull(кли.пас_выдан, ''))
                         END,
        @пас_дат_с = ' ' + CASE
                             WHEN Isnull(CONVERT(CHAR, кли.пас_дата, 104), '') = '' THEN ''
                             ELSE ' дата выд. ' + Isnull(CONVERT(CHAR, кли.пас_дата, 104), '')
                           END,
        @пас_дат_по = ' ' + CASE
                              WHEN Isnull(CONVERT(CHAR, кли.пас_дата_по, 104), '') = '' THEN ''
                              ELSE ' по ' + Isnull(CONVERT(CHAR, кли.пас_дата_по, 104), '')
                            END
      FROM
        кли
      INNER JOIN кли_пас_вид
        ON кли.пас_вид_код = кли_пас_вид.пас_вид_код
      WHERE      кли.кли_код = @кли_код

      -- Return the result of the function
      SET @пас = Rtrim(@пас_имя) + Rtrim(@пас_ном) + Rtrim(@пас_выд) + Rtrim(@пас_дат_с) + Rtrim(@пас_дат_по)

      RETURN Isnull(@пас,'')
  END
GO