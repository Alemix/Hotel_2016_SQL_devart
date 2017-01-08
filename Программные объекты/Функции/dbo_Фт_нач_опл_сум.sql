SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:
-- =============================================
CREATE FUNCTION [dbo].[Фт_нач_опл_сум] (
-- Add the parameters for the function here
@счет_код INT)
RETURNS @нач_опл_сум TABLE (
  счет_код    INT,
  кол         INT NULL,
  дкр         INT NULL,
  сут         NUMERIC(4, 1) NULL,
  нач_сум     NUMERIC(12, 2) NULL,
  опл_сум     NUMERIC(12, 2) NULL,
  бал_сум     NUMERIC(12, 2) NULL,
  всего_сум   NUMERIC(12, 2) NULL,
  ски_про     INT NULL,
  про_сум     NUMERIC(12, 2) NULL,
  дкр_сум     NUMERIC(12, 2) NULL,
  тел_сум     NUMERIC(12, 2) NULL,
  бар_сум     NUMERIC(12, 2) NULL,
  ски_сум     NUMERIC(12, 2) NULL,
  у_1_сум     NUMERIC(12, 2) NULL,
  у_2_сум     NUMERIC(12, 2) NULL,
  у_3_сум     NUMERIC(12, 2) NULL,
  дата_мин    DATE NULL,
  дата_мак    DATE NULL,
  сум_пропись VARCHAR(255) NULL )
AS
  BEGIN
      DECLARE @опл_сум NUMERIC(12, 2);
      DECLARE @нач_сум NUMERIC(12, 2);
      DECLARE @бал_сум NUMERIC(12, 2);

      SELECT @опл_сум = Isnull(Sum(опл_сум), 0)
      FROM   опл
      WHERE  опл.счет_код = @счет_код;

      SELECT @нач_сум = Isnull(Sum(нач_сум), 0)
      FROM   нач
             INNER JOIN опер
                     ON нач.опер_код = опер.опер_код
      WHERE  ( опер.счет_код = @счет_код )

      SELECT @бал_сум = @нач_сум - @опл_сум;

      INSERT @нач_опл_сум
      SELECT @счет_код,
             Isnull(Sum(нач.кол), 0),
             Isnull(Sum(нач.дкр), 0),
             Sum(нач.сут),
             @нач_сум,
             @опл_сум,
             @бал_сум,
             @нач_сум + Isnull(Sum(нач.ски_сум), 0),
             Isnull(Max(нач.ски_про), 0),
             Isnull(Sum(нач.про_сум), 0),
             Isnull(Sum(нач.дкр_сум), 0),
             Isnull(Sum(нач.тел_сум), 0),
             Isnull(Sum(нач.бар_сум), 0),
             Isnull(Sum(нач.ски_сум), 0),
             Isnull(Sum(нач.у_1_сум), 0),
             Isnull(Sum(нач.у_2_сум), 0),
             Isnull(Sum(нач.у_3_сум), 0),
             Min(нач.дата),
             Max(нач.дата),
             dbo.Фс_сумма_пропись_рубкоп(@нач_сум)
      FROM   нач
             INNER JOIN опер
                     ON нач.опер_код = опер.опер_код
      WHERE  ( опер.счет_код = @счет_код )

      RETURN;
  END
GO