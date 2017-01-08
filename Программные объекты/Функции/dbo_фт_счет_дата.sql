﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE   FUNCTION [dbo].[фт_счет_дата] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (
  SELECT DISTINCT счет.счет_код,
                  счет.счет_имя,
                  орг_хоз.орг_имя,
                  счет.док,
                  счет.дата,
                  опер.ном_код,
                  опер.дата_зае,
                  опер.дата_вые,
                  опер.сут,
                  опер.сут_факт,
                  Rtrim(кли.фам) + ' '
                  + Rtrim(кли.имя)+ ' '
                  + Rtrim(кли.отч) AS фио,
                  v_сум_нач.про_сум,
                  v_сум_нач.дкр_сум,
                  v_сум_нач.тел_сум,
                  v_сум_нач.бар_сум,
                  v_сум_нач.ски_сум,
                  v_сум_нач.у_1_сум,
                  v_сум_нач.у_3_сум,
                  v_сум_нач.у_2_сум,
                  v_сум_нач.нач_сум,
                  v_сум_опл.опл_сум,
                  v_сум_опл.о_1_сум,
                  v_сум_опл.о_2_сум,
                  v_сум_опл.о_3_сум,
                  опер.опер_код,
                  кли.фам,
                  кли.имя,
                  кли.отч
                
  FROM   опер
         LEFT OUTER JOIN v_сум_опл
           ON опер.опер_код = v_сум_опл.опер_код
         LEFT OUTER JOIN v_сум_нач
           ON опер.опер_код = v_сум_нач.опер_код
         LEFT OUTER JOIN кли
           ON опер.кли_код = кли.кли_код
         LEFT OUTER JOIN счет
           ON опер.счет_код = счет.счет_код
         LEFT OUTER JOIN орг_хоз
           ON счет.орг_хоз_код = орг_хоз.орг_код
         RIGHT OUTER JOIN dbo.Фт_мест_дата_з_глав(@дата) AS Фт_мест_дата_з_глав_1
           ON опер.опер_код = Фт_мест_дата_з_глав_1.опер_код
  

  
  

 
     )
GO