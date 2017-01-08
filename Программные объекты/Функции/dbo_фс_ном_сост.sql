SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2001-05-22
-- Description: тип 0 - Свобо, Зан
-- 	тип 1 - 0 мест , 12(записей в бд опер)
-- =============================================
CREATE FUNCTION [dbo].[фс_ном_сост] (
-- Add the parameters for the function here
@дата DATE,
@ном  INT,
@тип  INT)
RETURNS CHAR(3)
AS
  BEGIN
      -- Возврат
      DECLARE @возв CHAR(10);
      DECLARE @кол INT;

      SELECT
        @кол = COUNT(*)
      FROM
        dbo.опер
      WHERE  ном_код = @ном
         AND @дата >= CONVERT(DATE, дата_зае)
         AND @дата < CONVERT(DATE, дата_вые);

      IF @кол IS NULL
        BEGIN
            IF @тип = 0
              SET @возв = '0' -- Свободен

            IF @тип = 1
              SET @возв = 'С' -- Свободен
        END
      ELSE
        BEGIN
            IF @тип = 0
              SET @возв = CONVERT(CHAR(3), @кол) -- Занят 

            IF @тип = 1
              SET @возв = 'З' -- Занят
        END

      RETURN @возв
  END
GO