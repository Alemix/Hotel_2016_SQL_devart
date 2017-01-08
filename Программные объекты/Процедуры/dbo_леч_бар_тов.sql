SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[леч_бар_тов]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE бар_ост
SET    тов_код = вп.тов_код_min
FROM   бар_ост
       INNER JOIN в_пров_бар_тов вп
         ON тов_код = вп.тов_код_min
WHERE  тов_код IN (SELECT
                     тов_код_max
                   FROM
                     dbo.в_пров_бар_тов)

UPDATE бар_цена
SET    тов_код = вп.тов_код_min
FROM   бар_цена
       INNER JOIN в_пров_бар_тов вп
         ON тов_код = вп.тов_код_max
WHERE  тов_код IN (SELECT
                     тов_код_max
                   FROM
                     dbo.в_пров_бар_тов)

DELETE бар_тов
WHERE  тов_код IN (SELECT
                     тов_код_max
                   FROM
                     dbo.в_пров_бар_тов) 

end
GO