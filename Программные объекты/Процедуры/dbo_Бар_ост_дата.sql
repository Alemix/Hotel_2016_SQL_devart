SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Бар_ост_дата] (@дата DATE)
AS
  SET NOCOUNT ON;

  SELECT
    бар_ост.ном_код,
    бар_тов.тов_вид,
    бар_тов.тов_имя,
    бар_тов.тов,
    dbo.Фс_бар_тов_цена(бар_ост.тов_код, @дата) AS цена,
    бар_ост.тов_код
  FROM
    бар_ост
  LEFT OUTER JOIN бар_тов
    ON бар_ост.тов_код = бар_тов.тов_код
GO