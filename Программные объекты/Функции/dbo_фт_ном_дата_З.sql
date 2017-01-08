SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_ном_дата_З] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT
       DISTINCT
       ном.ном_код,
       ном.тип_код,
       CONVERT(INT, dbo.Фс_ном_сост (@дата, ном.ном_код, 0)) AS зан_мест,
       ном.мест,
       мест - CONVERT(INT, dbo.Фс_ном_сост (@дата, ном.ном_код, 0)) AS сво_мест
     FROM
       ном
     LEFT OUTER JOIN опер
       ON ном.ном_код = опер.ном_код
     WHERE           @дата >= CONVERT(DATE, опер.дата_зае)
                 AND @дата < CONVERT(DATE, опер.дата_вые))
GO