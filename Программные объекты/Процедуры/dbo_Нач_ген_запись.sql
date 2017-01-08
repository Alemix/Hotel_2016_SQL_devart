SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-05-22
-- Description:	 Это полу жесткая есть bl генерация записей - удаление и формирование новых
-- =============================================
CREATE PROCEDURE [dbo].[Нач_ген_запись]
-- Add the parameters for the stored procedure here
(@опер_код INT,
 @дата     DATE,
 @мест     INT,
 @дкр      numeric(12,2),
 @cут_вид  Numeric(5,1),
 @кол      INT,
 @цена     numeric(12,2),
 @про_сум  numeric(12,2),
 @дкр_сум  numeric(12,2),
 @ски_код  INT,
 @ски_про  INT,
 @ски_сум  numeric(12,2))
AS
  BEGIN
      DECLARE @есть INT;

      SELECT
        @есть = COUNT(*)
      FROM
        нач
      WHERE  опер_код = @опер_код
         AND дата = @дата

      IF @есть = 0
        INSERT INTO нач
                    (опер_код,
                     дата,
                     мест,
                     дкр,
                     сут,
                     
                     кол,
                     цена,
                     про_сум,
                     дкр_сум,
                     ски_код,
                     ски_про,
                     ски_сум,
                     бл)
        VALUES      (@опер_код,
                     @дата,
                     Isnull(@мест, 0),
                     Isnull(@дкр, 0),
                     @cут_вид,
                     @кол,
                     Isnull(@цена, 0),
                     Isnull(@про_сум, 0),
                     Isnull(@дкр_сум, 0),
                     Isnull(@ски_код, 0),
                     Isnull(@ски_про, 0),
                     Isnull(@ски_сум, 0),
                     0);
      ELSE
        --- из тех значений что пришли во вх пара, но не торгать др суммы
        UPDATE нач
        SET    мест = Isnull(@мест, 0),
               дкр = Isnull(@дкр, 0),
               сут = @cут_вид,
               кол = Isnull(@кол, 0),
               цена = Isnull(@цена, 0),
               про_сум = Isnull(@про_сум, 0),
               дкр_сум = Isnull(@дкр_сум, 0),
               ски_код = Isnull(@ски_код, 0),
               ски_про = Isnull(@ски_про, 0),
               ски_сум = Isnull(@ски_сум, 0),
               бл = 0
        WHERE  опер_код = @опер_код
           AND дата = @дата
           AND Isnull(бл, 0) = 0;
  END
GO