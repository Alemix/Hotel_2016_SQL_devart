SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_бар_тов_ном] (
-- Add the parameters for the function here
@ном_код INT,
@дата    DATE --для цены
)
RETURNS TABLE
AS
  RETURN
    (SELECT
    
       бар_тов.тов_код,
       -- бар_ост.ном_код,
       бар_тов.тов,
       (SELECT
          Isnull(SUM(кол), 0)
        FROM
          бар_ост
        WHERE  бар_ост.ном_код = @ном_код
           AND бар_ост.тов_код = бар_тов.тов_код) AS кол,
       dbo.Фс_бар_тов_цена(бар_тов.тов_код, @дата) AS цена
     FROM
       бар_тов
     ) 

/*
ORDER  BY
      бар_тов.тов
*/
GO