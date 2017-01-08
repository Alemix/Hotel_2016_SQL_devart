SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Пров_рег_все]
-- Add the parameters for the stored procedure here
@дата_нач DATE,
@дата_кон DATE
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @рег_пров_бел INT;
      DECLARE @опер_код_бел INT;
      DECLARE @рег_пров_ино INT;
      DECLARE @опер_код_ино INT;
      DECLARE @опер_код_CUR INT;

      UPDATE опер
      SET    рег_пров = 0
      WHERE  ( дата_зае >= @дата_нач
           AND дата_зае <= @дата_кон )

      -- первонач, минимальные значения от котрых отталкиват
      SELECT -- для беларусов
        @рег_пров_бел = MIN(Isnull(рег, 0))
      FROM
        v_опер
      WHERE  дата_зае >= @дата_нач
         AND дата_зае <= @дата_кон
         AND Isnull(гражд_код, 0) = 1
         --and Isnull(рег, 0) > 0  -- иначе становится ноль
         AND рег > 0 -- иначе становится ноль
      SELECT -- для беларусов
        @опер_код_бел = MIN(опер_код)
      FROM
        v_опер
      WHERE  рег = @рег_пров_бел
         AND дата_зае >= @дата_нач
         AND дата_зае <= @дата_кон
         AND Isnull(гражд_код, 0) = 1

      UPDATE опер
      SET    рег_пров = @рег_пров_бел
      WHERE  опер_код = @опер_код_бел;

      SELECT -- для иностранцев 
        @рег_пров_ино = MIN(Isnull(рег, 0))
      FROM
        v_опер
      WHERE  дата_зае >= @дата_нач
         AND дата_зае <= @дата_кон
         AND Isnull(гражд_код, 0) <> 1
         AND Isnull(рег, 0) > 0 -- иначе становится ноль

      SELECT -- для иностранцев 
        @опер_код_ино = MIN(опер_код)
      FROM
        v_опер
      WHERE  рег = @рег_пров_ино
         AND дата_зае >= @дата_нач
         AND дата_зае <= @дата_кон
         AND Isnull(гражд_код, 0) <> 1

      UPDATE опер
      SET    рег_пров = @рег_пров_ино
      WHERE  опер_код = @опер_код_ино;

      -- через CURSOR
      --DECLARE @опер_код INT
      DECLARE рег_CUR CURSOR FOR
        SELECT
          опер_код
        FROM
          опер
        WHERE  ( дата_зае >= @дата_нач
                 AND дата_зае <= @дата_кон )
           AND опер_код <> @опер_код_бел
           AND опер_код <> @опер_код_ино
           AND рег_пров = 0
        ORDER  BY
          опер_код

      OPEN рег_CUR

      WHILE 1 = 1
        BEGIN
            FETCH FROM рег_CUR INTO @опер_код_CUR

            IF @@FETCH_STATUS = -1
              BREAK

            IF @@FETCH_STATUS = -2
              CONTINUE

            EXECUTE dbo.Пров_рег_зап
              @опер_код_CUR,
              @дата_нач,
              @дата_кон
        END

      DEALLOCATE рег_CUR
  END
GO