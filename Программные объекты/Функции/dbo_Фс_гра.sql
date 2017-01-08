SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_гра] (
-- Add the parameters for the function here

@счет_код  int,
@кли_код int
)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @гра VARCHAR(100)
      DECLARE @гра_имя VARCHAR(50)
      DECLARE @гра_дата VARCHAR(30)

      SELECT
        @гра_имя = ' ' + CASE
                           WHEN Isnull(гра.гра_имя, '') = '' THEN ''
                           ELSE 'КПП ' + Rtrim(Isnull(гра.гра_имя, ''))
                         END,
        @гра_дата = ' ' + CASE
                            WHEN Isnull(CONVERT(CHAR, во.гра_дата, 104), '') = '' THEN ''
                            ELSE ' дата ' + Isnull(CONVERT(CHAR, во.гра_дата, 104), '')
                          END
      FROM
        во_кли_счет во
      LEFT OUTER JOIN гра
        ON во.гра_код = гра.гра_код
      WHERE      во.кли_код = @кли_код and  во.счет_код = @счет_код

      -- Return the result of the function
      SET @гра = Rtrim(@гра_имя) + Rtrim(@гра_дата)

      RETURN Isnull(@гра, '')
  END
GO