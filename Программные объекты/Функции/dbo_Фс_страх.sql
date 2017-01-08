SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_страх] (
-- Add the parameters for the function here
@счет_код  int,
@кли_код int

)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @страх VARCHAR(100)
      DECLARE @страх_имя VARCHAR(100)
      DECLARE @страх_кем VARCHAR(100)
   
      DECLARE @страх_номер VARCHAR(100)
      DECLARE @страх_дата_с VARCHAR(100)
      DECLARE @страх_дата_по VARCHAR(100)

      SELECT
        @страх_имя = 'Страховой полис',
        @страх_кем = ' ' + CASE
                            WHEN Isnull(квв.страх_кем_имя, '') = '' THEN ''
                            ELSE ' выдан ' + Rtrim(Isnull(квв.страх_кем_имя, ''))
                          END,
    
        @страх_номер = ' ' + CASE
                              WHEN Isnull(во.страх_номер, '') = '' THEN ''
                              ELSE ' номер ' + Rtrim(Isnull(во.страх_номер, ''))
                            END,
        @страх_дата_с = ' ' + CASE
                               WHEN Isnull(CONVERT(CHAR, во.страх_дата_с, 104), '') = '' THEN ''
                               ELSE ' c ' + Isnull(CONVERT(CHAR, во.страх_дата_с, 104), '')
                             END,
        @страх_дата_по = ' ' + CASE
                                WHEN Isnull(CONVERT(CHAR, во.страх_дата_по, 104), '') = '' THEN ''
                                ELSE ' по ' + Isnull(CONVERT(CHAR, во.страх_дата_по, 104), '')
                              END
      FROM
       dbo.во_кли_счет во
      INNER JOIN кли_страх_кем квв
        ON во.страх_кем_код = квв.страх_кем_код
      WHERE      во.кли_код = @кли_код and  во.счет_код = @счет_код

      -- Return the result of the function
      SET @страх = Rtrim(@страх_имя) +   Rtrim(@страх_кем) +   Rtrim(@страх_номер) + Rtrim(@страх_дата_с) + Rtrim(@страх_дата_по) 

      RETURN isnull(@страх,'')
  END
GO