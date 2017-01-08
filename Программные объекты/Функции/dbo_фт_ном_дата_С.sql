SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_ном_дата_С] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT ном.ном_код,
       ном.тип_код,
       ном.мест
FROM   ном
EXCEPT
SELECT ном_код,
       тип_код,
       мест
FROM   dbo.Фт_ном_дата_З(@дата) )
GO