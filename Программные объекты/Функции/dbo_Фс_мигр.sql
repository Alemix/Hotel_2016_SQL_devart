SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_мигр] (
-- Add the parameters for the function here

@счет_код  int,
@кли_код int
)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @миг VARCHAR(100)
      DECLARE @миг_имя VARCHAR(100)
      DECLARE @миг_кем VARCHAR(100)
   
      DECLARE @миг_номер VARCHAR(200)
      DECLARE @миг_дата_с VARCHAR(200)
      DECLARE @миг_дата_по VARCHAR(200)

      SELECT
        @миг_имя = '',
        
    
        @миг_номер = ' ' + CASE
                              WHEN Isnull(во.миг_карта, '') = '' THEN ''
                              ELSE 'Миграционная карта номер ' + Rtrim(Isnull(во.миг_карта, ''))
                            END,
        @миг_дата_с = ' ' + CASE
                               WHEN Isnull(CONVERT(CHAR, во.миг_карта_дата_с, 104), '') = '' THEN ''
                               ELSE ' c ' + Isnull(CONVERT(CHAR, во.миг_карта_дата_с, 104), '')
                             END,
        @миг_дата_по = ' ' + CASE
                                WHEN Isnull(CONVERT(CHAR, во.миг_карта_дата_по, 104), '') = '' THEN ''
                                ELSE ' по ' + Isnull(CONVERT(CHAR, во.миг_карта_дата_по, 104), '')
                              END
      FROM
       dbo.во_кли_счет во
      WHERE      во.кли_код = @кли_код and  во.счет_код = @счет_код

      -- Return the result of the function
      SET @миг = Rtrim(@миг_имя) +  Rtrim(@миг_номер) + Rtrim(@миг_дата_с) + Rtrim(@миг_дата_по) 

      RETURN isnull(@миг,'')
  END
GO