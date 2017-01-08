SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_ном_дата_сост_тип_табл] (
-- Add the parameters for the function here
@дата date)
RETURNS TABLE
AS
  RETURN(
     SELECT фт.тип_имя,
       CASE сост
         WHEN 'С' THEN 1
         WHEN 'З' THEN 0
       END AS cво,
       CASE сост
         WHEN 'С' THEN 0
         WHEN 'З' THEN 1
       END AS зан
FROM   Фт_ном_дата_сост_тип(@дата) AS фт 
)
GO