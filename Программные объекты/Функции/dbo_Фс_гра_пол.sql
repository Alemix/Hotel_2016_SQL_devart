SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_гра_пол] (
-- Add the parameters for the function here
@кли_код INT)
RETURNS CHAR(100)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @гра_пол CHAR(10)

      SELECT
        @гра_пол = CASE
                     WHEN Isnull(пол, 1) = 2 THEN 'гражданки'
                     WHEN Isnull(пол, 1) = 1 THEN 'гражданина'
                     ELSE ''
                   END
      FROM
        dbo.кли
      WHERE  кли_код = @кли_код

      RETURN @гра_пол
  END
/*   SELECT
        @гра_пол = CASE
                     WHEN Isnull(@пол, 1) = 0 THEN 'гражданки'
                     WHEN Isnull(@пол, 1) = 1 THEN 'гражданина'
                   END*/
GO