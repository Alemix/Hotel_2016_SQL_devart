SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_нач_сум_опер] (
-- Add the parameters for the function here
@опер_код INT)
RETURNS @нач_сум TABLE (
  в      CHAR(1) NULL,
  услуга CHAR(20) NULL,
  кол    CHAR(20) NULL,
  сут    CHAR(20) NULL,
  цена   numeric(12,2) NULL,
  сумма  numeric(12,2) NULL )
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @услуга CHAR(20),
              @кол    CHAR(20),
              @сут    CHAR(20),
              @цена   numeric(12,2),
              @сумма numeric(12,2)

      -- Проживание
      INSERT @нач_сум
      SELECT 'н'              AS в,
             'Проживание'     AS услуга,
             мест.мест_имя    AS кол,
             SUM(нач.сут)     AS сут,
             MIN(нач.про_сум) AS цена,
             SUM(нач.про_сум) AS сумма
      FROM   нач
             LEFT OUTER JOIN мест
               ON нач.мест = мест.мест_код
      WHERE  ( нач.опер_код = @опер_код )
      GROUP  BY мест.мест_имя

      -- Дкр
      SELECT @услуга = 'Доп. кровать',
             @кол = '',
             @сут = SUM (сут),
             @цена = MIN(дкр_сум),
             @сумма = SUM(дкр_сум)
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код )
             AND дкр_сум != 0;

      IF @сумма != 0
        INSERT @нач_сум
        SELECT 'н',
               @услуга,
               @кол,
               @сут,
               @цена,
               @сумма;

      -- Льгота 
      INSERT @нач_сум
      SELECT 'с'              AS в,
             'Скидка'         AS услуга,
             ски.ски_имя      AS кол,
             SUM(нач.сут)     AS сут,
             MAX(нач.ски_про) AS цена,
             SUM(нач.ски_сум) AS сумма
      FROM   нач
             LEFT OUTER JOIN ски
               ON нач.ски_код = ски.ски_код
      WHERE  ( нач.опер_код = @опер_код
               AND ски_сум != 0 )
      GROUP  BY ски.ски_имя

      -- телефон 
      INSERT @нач_сум
      SELECT 'с'                AS в,
             'Телефон'          AS услуга,
             COUNT(нач.тел_сум) AS кол,
             0                  AS сут,
             0                  AS цена,
             SUM(нач.тел_сум)   AS сумма
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код
               AND тел_сум != 0 )

 -- бар 
      INSERT @нач_сум
      SELECT 'с'                AS в,
             'Бар'          AS услуга,
             COUNT(нач.бар_сум) AS кол,
             0                  AS сут,
             0                  AS цена,
             SUM(нач.бар_сум)   AS сумма
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код
               AND бар_сум != 0 )
               
               -- усл_1 
      INSERT @нач_сум
      SELECT 'с'                AS в,
             'Услуа 1'          AS услуга,
             COUNT(нач.у_1_сум) AS кол,
             0                  AS сут,
             0                  AS цена,
             SUM(нач.у_1_сум)   AS сумма
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код
               AND у_1_сум != 0 ) 


             -- усл_2 
      INSERT @нач_сум
      SELECT 'с'                AS в,
              'Услуа 2'           AS услуга,
             COUNT(нач.у_1_сум) AS кол,
             0                  AS сут,
             0                  AS цена,
             SUM(нач.у_1_сум)   AS сумма
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код
               AND у_1_сум != 0 )             
               
                -- усл_1 
      INSERT @нач_сум
      SELECT 'с'                AS в,
              'Услуа 2'          AS услуга,
             COUNT(нач.у_1_сум) AS кол,
             0                  AS сут,
             0                  AS цена,
             SUM(нач.у_1_сум)   AS сумма
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код
               AND у_1_сум != 0 ) 













      /* нужен счет_код
            -- оплата по группам
            INSERT @нач_сум
            SELECT 'о'                AS в,
                   'Оплата'           AS услуга,
                   вид.опл_вид_имя    AS кол,
                   ''                 AS сут,
                   COUNT(опл.опл_сум) AS цена,
                   SUM(опл.опл_сум)   AS сумма
            FROM   опл
                   LEFT OUTER JOIN dbo.опер_опл_вид вид
                     ON опл.опл_вид_код = вид.опл_вид_код
            WHERE  ( опл.опер_код = @опер_код )
            GROUP  BY вид.опл_вид_имя
      */
      RETURN;
  END
GO