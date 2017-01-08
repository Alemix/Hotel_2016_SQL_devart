SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_кли_увед] (
-- Add the parameters for the function here
@счет_код INT,
@кли_код  INT)
RETURNS TABLE
AS
  RETURN
    (SELECT во_кли_счет.счет_код as счет_код_увед ,
            во_кли_счет.кли_код as кли_код_увед,
            кли.фам,
            кли.имя,
            кли.отч,
            Rtrim(кли.имя) + ' ' + Rtrim(кли.отч) AS имя_отч,
      
            кли.рожд_дата AS рожд_дата,
            dbo.Фс_н(Datepart(DAY, кли.рожд_дата), 2) AS др_д,
            dbo.Фс_н(Datepart(MONTH, кли.рожд_дата), 2) AS др_м,
            dbo.Фс_н(Datepart(YEAR, кли.рожд_дата), 4) AS др_г,
         
            dbo.Фс_н(Datepart(DAY, кли.пас_дата), 2) AS пдс_д,
            dbo.Фс_н(Datepart(MONTH, кли.пас_дата), 2) AS пдс_м,
            dbo.Фс_н(Datepart(YEAR, кли.пас_дата), 4) AS пдс_г,
      
            dbo.Фс_н(Datepart(DAY, кли.пас_дата_по), 2) AS пдп_д,
            dbo.Фс_н(Datepart(MONTH, кли.пас_дата_по), 2) AS пдп_м,
            dbo.Фс_н(Datepart(YEAR, кли.пас_дата_по), 4) AS пдп_г,
       
            dbo.Фс_н(Datepart(DAY, во_кли_счет.дата_зае), 2) AS дз_д,
            dbo.Фс_н(Datepart(MONTH, во_кли_счет.дата_зае), 2) AS дз_м,
            dbo.Фс_н(Datepart(YEAR, во_кли_счет.дата_зае), 4) AS дз_г,
        
            dbo.Фс_н(Datepart(DAY, во_кли_счет.дата_вые), 2) AS дв_д,
            dbo.Фс_н(Datepart(MONTH, во_кли_счет.дата_вые), 2) AS дв_м,
            dbo.Фс_н(Datepart(YEAR, во_кли_счет.дата_вые), 4) AS дв_г,
           
            Isnull(кли.пас_номер, '') AS пас_номер,
            Isnull(стр.гражд, '') AS гражд,
            Isnull(кли_пол.пол, '') AS пол,
			Isnull(кли_виза_вид.виза_тип, '') AS виза_тип,
        
                
           CASE
              WHEN во_кли_счет.гра_дата IS NULL THEN Isnull(гра.гра_имя, '')
              ELSE Rtrim(CONVERT(CHAR, Isnull(во_кли_счет.гра_дата, ''), 104)) + ' - ' + Isnull(гра.гра_имя, '')
            END AS гра
    
     FROM   кли_виза_вид
            RIGHT OUTER JOIN во_кли_счет
                             LEFT OUTER JOIN кли_страх_кем
                               ON во_кли_счет.страх_кем_код = кли_страх_кем.страх_кем_код
                             LEFT OUTER JOIN гра
                               ON во_кли_счет.гра_код = гра.гра_код
              ON кли_виза_вид.виза_вид_код = во_кли_счет.виза_вид_код
            LEFT OUTER JOIN стр
                            RIGHT OUTER JOIN кли
                              ON стр.стр_код = кли.гражд_код
              ON во_кли_счет.кли_код = кли.кли_код
            LEFT OUTER JOIN кли_пас_вид
              ON кли.пас_вид_код = кли_пас_вид.пас_вид_код
            LEFT OUTER JOIN кли_пол
              ON кли.пол = кли_пол.пол_код
     WHERE  ( во_кли_счет.счет_код = @счет_код
              AND во_кли_счет.кли_код = @кли_код ))
GO