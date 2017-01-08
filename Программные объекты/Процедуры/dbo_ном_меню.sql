SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011 11 14
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ном_меню]
-- Add the parameters for the stored procedure here
-- Add the parameters for the function here
@дата DATE,
@вид  INT -- 1=свобод, 2=подселение, 3=все
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      -- Insert statements for procedure here
      IF @вид = 1 --1=свобод, 2=подселение
        SELECT
          фт_ном_дата_С_мест_1.ном_код,
          ном_тип.тип_имя,
          фт_ном_дата_С_мест_1.мест,
          фт_ном_дата_С_мест_1.зан_мест,
          фт_ном_дата_С_мест_1.сво_мест,
          CASE Isnull(ном.кур, 0)
            WHEN 0 THEN '    '
            WHEN 1 THEN 'Кур.'
          END AS кур,
          dbo.Фс_ном_имя(ном.ном_код) AS н
        FROM
          dbo.Фт_ном_дата_с_мест(@дата) AS фт_ном_дата_С_мест_1
        LEFT OUTER JOIN ном
          ON фт_ном_дата_С_мест_1.ном_код = ном.ном_код
        LEFT OUTER JOIN ном_тип
          ON фт_ном_дата_С_мест_1.тип_код = ном_тип.тип_код
        WHERE           ( фт_ном_дата_С_мест_1.зан_мест = 0 ) -- это отличие
        ORDER           BY
          ном_тип.тип_имя,
          фт_ном_дата_С_мест_1.ном_код

      IF @вид = 2 --1=свобод, 2=подселение
        SELECT
          фт_ном_дата_С_мест_1.ном_код,
          ном_тип.тип_имя,
          фт_ном_дата_С_мест_1.мест,
          фт_ном_дата_С_мест_1.зан_мест,
          фт_ном_дата_С_мест_1.сво_мест,
          CASE Isnull(ном.кур, 0)
            WHEN 0 THEN '    '
            WHEN 1 THEN 'Кур.'
          END AS кур,
          dbo.Фс_ном_имя(ном.ном_код) AS н
        FROM
          dbo.Фт_ном_дата_с_мест(@дата) AS фт_ном_дата_С_мест_1
        LEFT OUTER JOIN ном
          ON фт_ном_дата_С_мест_1.ном_код = ном.ном_код
        LEFT OUTER JOIN ном_тип
          ON фт_ном_дата_С_мест_1.тип_код = ном_тип.тип_код
        ORDER           BY
          ном_тип.тип_имя,
          фт_ном_дата_С_мест_1.ном_код

      IF @вид = 3 --3=все
        BEGIN
            SELECT
              ном.ном_код,
              ном_тип.тип_имя,
              ном.мест,
              0 AS зан_мест,
              ном.мест AS сво_мест,
              CASE Isnull(ном.кур, 0)
                WHEN 0 THEN '    '
                WHEN 1 THEN 'Кур.'
              END AS кур,
              dbo.Фс_ном_имя(ном_код) AS н
            FROM
              ном
            LEFT OUTER JOIN ном_тип
              ON ном.тип_код = ном_тип.тип_код
        END
  END
GO