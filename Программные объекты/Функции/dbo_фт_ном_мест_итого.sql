SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_ном_мест_итого] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT ном_код,
            тип_код,
            мест,
            'С' as сост
     FROM   dbo.фт_ном_дата_С(@дата)
     UNION
     SELECT ном_код,
            тип_код,
            мест,
            'З' as сост
     FROM   dbo.фт_ном_дата_З(@дата))
GO