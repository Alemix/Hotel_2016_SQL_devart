SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_мест_дата_З] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT
       ном_код,
       кли_код,
       дата_зае,
       дата_вые
     FROM
       опер
     WHERE  @дата >= CONVERT(DATE, опер .дата_зае)
        AND @дата < CONVERT(DATE, опер.дата_вые))
GO