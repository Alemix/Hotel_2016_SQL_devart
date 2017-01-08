SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_бар_опер_имя] (
-- Add the parameters for the function here
@счет_код INT,
@дата     DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT
       опер_код,
       Rtrim(CONVERT(CHAR, ном_код)) + ' ' + Rtrim(dbo.Фс_фам_ио(кли_код)) AS опер_имя,
       (SELECT
          COUNT(*)
        FROM
          опер о2
        WHERE  ( о2.опер_код = о1.опер_код )
           AND ( @дата >= о2.дата_зае
                 AND @дата < о2.дата_вые )) AS жил,
       ном_код
     FROM
       опер о1
     WHERE  счет_код = @счет_код)
GO