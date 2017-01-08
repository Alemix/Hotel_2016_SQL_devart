SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_ост_о]
AS
  SET NOCOUNT ON;

  SELECT
     бар_ост.ост_код,
    бар_ост.ном_код,
    бар_тов.тов_вид,
    бар_тов.тов_имя,
    бар_тов.тов,
    бар_ост.кол,
  /*
    dbo.Фс_бар_тов_цена(бар_ост.тов_код, Getdate()) AS цена,
    dbo.Фс_бар_тов_цена(бар_ост.тов_код, Getdate()) * бар_ост.кол AS сумма,*/
    бар_ост.тов_код
  FROM
    бар_ост
  LEFT OUTER JOIN бар_тов
    ON бар_ост.тов_код = бар_тов.тов_код
GO