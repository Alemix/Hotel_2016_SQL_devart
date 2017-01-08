SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[пров_кли_фио] @фам CHAR(30),
                                     @имя CHAR(30),
                                     @отч CHAR(30),
                                     @код INT
AS
  BEGIN
      DECLARE @кли_код INT

      SELECT
        Isnull(кли_код, 0)
      FROM
        кли
      WHERE  Rtrim(Isnull(фам, '')) = Rtrim(Isnull(@фам, ''))
         AND Rtrim(Isnull(имя, '')) = Rtrim(Isnull(@имя, ''))
         AND Rtrim(Isnull(отч, '')) = Rtrim(Isnull(@отч, ''))
         AND кли_код != @код
  END
/*
     SELECT
       @кли_код = кли_код
     FROM
       кли
     WHERE  Rtrim(Isnull(фам, '')) = Rtrim(Isnull(@фам, ''))
        AND Rtrim(Isnull(имя, '')) = Rtrim(Isnull(@имя, ''))
        AND Rtrim(Isnull(отч, '')) = Rtrim(Isnull(@отч, ''))
        AND кли_код != @код
        

     -- этот текущий кли_код 
     IF @кли_код = @код
       SET @кли_код = 0

     RETURN Isnull(@кли_код, 0)
 */
GO