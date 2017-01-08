SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	 с учетом переселения для отчета  с указанием периода
-- =============================================
CREATE FUNCTION [dbo].[Фт_кли_кол_зае_иностранцы] (
-- Add the parameters for the function here
@дата_с  DATE,
@дата_по DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT
       COUNT(опер.рег) AS кол,
       опер.кли_код,
       Isnull(опер.рег, 0) AS рег,
       опер.счет_код,
       MIN(опер.дата_зае) AS дата_зае,
       MAX(опер.дата_вые) AS дата_вые,
       стр.стр_имя,
       кли.ФИО
       
     FROM
       кли
     LEFT OUTER JOIN  стр
       ON кли.гражд_код = стр.стр_код
     RIGHT OUTER JOIN опер
       ON кли.кли_код = опер.ном_код
     GROUP            BY
      опер.кли_код,
      опер.рег,
      опер.счет_код,
      стр.стр_имя,
      кли.ФИО
      
     HAVING           ( MIN(дата_зае) >= @дата_с )
                      AND ( MAX(дата_вые) < @дата_по ))
GO