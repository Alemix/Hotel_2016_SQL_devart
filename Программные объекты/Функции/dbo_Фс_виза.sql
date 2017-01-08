SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_виза] (
-- Add the parameters for the function here
@счет_код int,
@кли_код int
)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @виза VARCHAR(100)
      DECLARE @виза_имя VARCHAR(20)
      DECLARE @виза_вид VARCHAR(20)
      DECLARE @виза_сер VARCHAR(30)
      DECLARE @виза_номер VARCHAR(30)
      DECLARE @виза_дата_с VARCHAR(30)
      DECLARE @виза_дата_по VARCHAR(30)

      SELECT
        @виза_имя = 'Виза',
        @виза_вид = ' ' + CASE
                            WHEN Isnull(квв.виза_вид_имя, '') = '' THEN ''
                            ELSE ' вид ' + Rtrim(Isnull(квв.виза_вид_имя, ''))
                          END,
       @виза_сер = ' ' + CASE
                            WHEN Isnull(во.виза_сер, '') = '' THEN ''
                            ELSE ' серия ' + Rtrim(Isnull(во.виза_сер, ''))
                          END,
        @виза_номер = ' ' + CASE
                              WHEN Isnull(во.виза_номер, '') = '' THEN ''
                              ELSE ' номер ' + Rtrim(Isnull(во.виза_номер, ''))
                            END,
        @виза_дата_с = ' ' + CASE
                               WHEN Isnull(CONVERT(CHAR, во.виза_дата_с, 104), '') = '' THEN ''
                               ELSE ' c ' + Isnull(CONVERT(CHAR, во.виза_дата_с, 104), '')
                             END,
        @виза_дата_по = ' ' + CASE
                                WHEN Isnull(CONVERT(CHAR, во.виза_дата_по, 104), '') = '' THEN ''
                                ELSE ' по ' + Isnull(CONVERT(CHAR, во.виза_дата_по, 104), '')
                              END
      FROM
       dbo.во_кли_счет во
      INNER JOIN кли_виза_вид квв
        ON во.виза_вид_код = квв.виза_вид_код
      WHERE      во.кли_код = @кли_код and  во.счет_код = @счет_код

      -- Return the result of the function
      SET @виза = Rtrim(@виза_имя) + +Rtrim(@виза_сер) + Rtrim(@виза_номер) + Rtrim(@виза_дата_с) + Rtrim(@виза_дата_по) + Rtrim(@виза_вид)

      RETURN Isnull(@виза,'')
  END
GO