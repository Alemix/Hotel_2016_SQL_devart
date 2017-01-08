SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Баланс_счф_оплату]
-- Add the parameters for the stored procedure here
(@счет_код INT,
 @счф_код  INT)
AS
  BEGIN
      DECLARE @бал_сум BIGINT;
      DECLARE @опл_дата DATE;
      DECLARE @счф_есть INT;
      DECLARE @счф_имя VARCHAR(100);

      SELECT
        @бал_сум = Isnull(счф_итого, 0),
        @опл_дата = опл_дата
      FROM
        dbo.счф
      WHERE  счф_код = @счф_код

      SELECT
        @счф_есть = счет_код
      FROM
        dbo.счет
   WHERE  счф_код = @счф_код and счет_код <> @счет_код 

  
      -- Isnull(CONVERT(VARCHAR, опл_дата, 104), '')
      IF @бал_сум <> 0
         AND @опл_дата IS NOT NULL
         AND @счф_есть IS  NULL
        BEGIN
            SELECT
              @счф_имя = 'счф № ' + dbo.Фс_счф_имя(@счф_код)

            DELETE опл
            WHERE  ( счет_код = @счет_код
                 AND опл_вид_код = 3 )

            INSERT INTO опл
                        (счет_код,
                         дата,
                         опл_сум,
                         опл_вид_код,
                         инф_опл)
            VALUES      (@счет_код,
                         @опл_дата,
                         @бал_сум,
                         3,
                         @счф_имя )

            RETURN 0 -- все ОК
        END
      ELSE
        BEGIN
            IF @счф_есть = 0
              -- не возр отрицательный ноль
              SET @счф_есть = 1

            IF @опл_дата IS NULL
              -- если -1 только дата  если меньше -1 и дата и счет плохо
              RETURN @счф_есть * -1
            ELSE
              -- только счет плохо
              RETURN @счф_есть
        END
  END
GO