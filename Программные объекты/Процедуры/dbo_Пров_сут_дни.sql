SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 19.07.2012
-- Description:	сут
-- =============================================
CREATE PROCEDURE [dbo].[Пров_сут_дни]
-- сут_дни - это количество дней между датами зае. и вые. без сут_пол
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

   /* 1. стаарые значения ПОЛ_СУТ
   */
       UPDATE [опер]
       SET    пол_сут_зае = 1
       WHERE  ( сут - Datediff(DAY, дата_зае, дата_вые) ) = 0.5
   
   
   /* 2.
   */
       UPDATE [опер]
       SET    сут_дни = Datediff(DAY, дата_зае, дата_вые)
   
   
   /* 3. 
   */
      UPDATE [опер]
      SET    сут = сут_дни + сут_пол
      WHERE  сут - ( сут_дни + сут_пол ) <> 0
   
  
  END
GO