SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE    FUNCTION [dbo].[фт_кли_кол_зае] (
-- Add the parameters for the function here
@кли_код int)
RETURNS TABLE
AS
  RETURN
    (
 
 SELECT
   
   опер.дата_зае,
   опер.дата_вые,
   опер.сут,
   опер.ном_код,
   опер.инф_зае,
   опер.инф_вые,
   опер.кли_код,
 dbo.Фс_фио(опер.кли_код) as фио ,
   опер.сут_факт
 FROM
   кли
 INNER JOIN опер
   ON кли.кли_код = опер.кли_код
 WHERE      ( кли.кли_код = @кли_код ) 
 

     )
GO