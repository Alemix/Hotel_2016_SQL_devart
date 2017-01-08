SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Пров_рег_зап]
-- Add the parameters for the stored procedure here
@опер_код INT,
@дата_нач DATE,
@дата_кон DATE
AS
  BEGIN
      DECLARE @рег_пров INT
      DECLARE @гражд_код INT
      DECLARE @рег_ноль INT -- если рег = 0 не надо
      DECLARE @рег_кол_один INT -- если рег = 
      DECLARE @кли_код INT --  
      SELECT -- если ноль не трогать
      @рег_ноль = Isnull(рег, 0),
      @кли_код = Isnull(кли_код, 0)
      FROM   опер
      WHERE  опер_код = @опер_код

      IF @рег_ноль = 0
        RETURN -- если ноль не трогать
      ELSE
        SELECT -- определяю гражд
        @гражд_код = Isnull(кли.гражд_код, 0)
        FROM   опер
               LEFT OUTER JOIN кли
                 ON опер.кли_код = кли.кли_код
        WHERE  опер.опер_код = @опер_код

      -- Если один рег (переселение)
      SELECT @рег_кол_один = COUNT(рег)
      FROM   опер
      WHERE  кли_код = @кли_код
             AND рег = @рег_ноль
             AND дата_зае >= @дата_нач
             AND дата_зае <= @дата_кон

      IF @гражд_код = 1 -- Белорус
        SELECT @рег_пров = MAX(Isnull(опер.рег_пров, 0)) + 1
        FROM   опер
               LEFT OUTER JOIN кли
                 ON опер.кли_код = кли.кли_код
        WHERE  ( Isnull(кли.гражд_код, 0) = 1 )
               AND дата_зае >= @дата_нач
               AND дата_зае <= @дата_кон
      ELSE
        SELECT @рег_пров = MAX(Isnull(опер.рег_пров, 0)) + 1
        FROM   опер
               LEFT OUTER JOIN кли
                 ON опер.кли_код = кли.кли_код
        WHERE  ( Isnull(кли.гражд_код, 0) <> 1 )
               AND дата_зае >= @дата_нач
               AND дата_зае <= @дата_кон

      IF @рег_кол_один = 1
        UPDATE опер
        SET    рег_пров = @рег_пров
        WHERE  опер_код = @опер_код
      ELSE
        UPDATE опер
        SET    рег_пров = @рег_пров
        WHERE  кли_код = @кли_код
               AND рег = @рег_ноль
               AND дата_зае >= @дата_нач
               AND дата_зае <= @дата_кон
  END
GO