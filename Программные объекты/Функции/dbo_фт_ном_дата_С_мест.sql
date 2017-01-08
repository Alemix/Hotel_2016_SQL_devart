SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[фт_ном_дата_С_мест] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (WITH ном_сво (ном_код)
     AS (SELECT ном.ном_код
         FROM   ном
         EXCEPT
         SELECT ном_код
         FROM   dbo.Фт_ном_дата_з(@дата)
     ) 
     SELECT нс.ном_код,
       н.тип_код,
       isnull(н. мест,0) as мест,
       0           AS зан_мест,
       isnull(н. мест,0)  AS сво_мест
FROM   ном AS н
       INNER JOIN ном_сво AS нс
         ON н.ном_код = нс.ном_код
UNION
SELECT ном_код,
       тип_код,
       isnull(мест,0) as мест,
       isnull(зан_мест,0) as зан_мест ,
       isnull(сво_мест,0) as сво_мест
FROM   dbo.Фт_ном_дата_з(@дата)
WHERE  сво_мест > 0 
)
GO