﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_нач_сум_счет_вью] (
-- Add the parameters for the function here
@счет_код INT)
RETURNS @нач_сум TABLE (
  услуга CHAR(20) NULL,
  кол    CHAR(20) NULL,
  сут    NUMERIC(4, 1) NULL,
  цена   numeric(12,2) NULL,
  сумма  numeric(12,2) NULL )
AS
  BEGIN
      INSERT @нач_сум
      SELECT
        усл.усл_имя AS услуга,
        SUM(v_нач.кол) AS кол,
        SUM(v_нач.сут) AS сут,
        /*    SUM(v_нач.сумма) / SUM(v_нач.сут) AS цена,*/
        v_нач.цена AS цена,
        SUM(v_нач.сумма) AS сумма
      FROM
        v_нач
      LEFT OUTER JOIN усл
        ON v_нач.усл_код = усл.усл_код
      WHERE           ( v_нач.счет_код = @счет_код )
      GROUP           BY
        усл.усл_имя,
        усл.усл_код,
        v_нач.цена
      ORDER           BY
        усл.усл_код

      INSERT @нач_сум
      SELECT
        'Итого Начислено' AS услуга,
        SUM(нач.кол) AS кол,
        SUM(нач.сут) AS сут,
        0 AS цена,
        SUM(нач.нач_сум) AS сумма
      FROM
        нач
      LEFT OUTER JOIN опер
        ON нач.опер_код = опер.опер_код
      WHERE           ( опер.счет_код = @счет_код )

      RETURN;
  END
GO