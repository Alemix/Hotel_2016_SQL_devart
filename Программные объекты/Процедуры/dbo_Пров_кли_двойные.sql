SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Пров_кли_двойные]
AS
  BEGIN
      -- через CURSOR
      DECLARE @ФИО VARCHAR(100);
      DECLARE @кли_код_мин INT;
      DECLARE кли_код_двойной_CUR CURSOR FOR
        SELECT
          ФИО,
          MIN(кли_код) AS кли_код_мин
        FROM
          dbo.кли
        GROUP  BY ФИО
        HAVING ( COUNT(кли_код) > 1 )

      OPEN кли_код_двойной_CUR

      WHILE 1 = 1
        BEGIN
            FETCH FROM кли_код_двойной_CUR INTO @ФИО, @кли_код_мин

            IF @@FETCH_STATUS = -1
              BREAK

            IF @@FETCH_STATUS = -2
              CONTINUE

            UPDATE [опер]
            SET    [кли_код_был] = isnull(кли_код_был,кли_код),
                   [кли_код] = @кли_код_мин
            WHERE  [кли_код] IN (SELECT
                                   *
                                 FROM
                                   [Hotel_2016].[dbo].[Фт_кли_код_двойные] (@ФИО))

            UPDATE [кли]
            SET    [кли_код_был] = isnull(кли_код_был,@кли_код_мин)
            WHERE  [кли_код] IN (SELECT
                                   *
                                 FROM
                                   [Hotel_2016].[dbo].[Фт_кли_код_двойные] (@ФИО))
        END

      DEALLOCATE кли_код_двойной_CUR
  END
GO