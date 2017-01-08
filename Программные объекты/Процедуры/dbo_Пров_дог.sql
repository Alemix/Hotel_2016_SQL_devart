SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 19.07.2012
-- Description:	сут
-- =============================================
CREATE PROCEDURE [dbo].[Пров_дог]
-- сут_дни - это количество дней между датами зае. и вые. без сут_пол
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      --SELECT *
      --FROM   [Hotel_2016].[dbo].[дог]

      DELETE FROM [Hotel_2016].[dbo].[дог]
      WHERE  дог_орг IS NULL

      UPDATE Hotel_2016.dbo.дог
      SET    дог_дата = Isnull(дог_дата, CONVERT(DATE, '2000-01-01'))
      WHERE  дог_дата IS NULL

      UPDATE Hotel_2016.dbo.дог
      SET    дог_ном = Isnull(дог_ном, 0)
      WHERE  дог_ном IS NULL

      UPDATE Hotel_2016.dbo.дог
      SET    дог_ном = Isnull(дог_ном, 0)
      WHERE  дог_ном IS NULL

      UPDATE Hotel_2016.dbo.дог
      SET    дог_вид_код = Isnull(дог_вид_код, 1)
      WHERE  дог_вид_код IS NULL

      UPDATE Hotel_2016.dbo.дог
      SET    дог_хоз = Isnull(дог_хоз, 2)
      WHERE  дог_хоз IS NULL
  END

--/* 1. стаарые значения ПОЛ_СУТ
--*/
--    UPDATE [опер]
--    SET    пол_сут_зае = 1
--    WHERE  ( сут - Datediff(DAY, дата_зае, дата_вые) ) = 0.5
GO