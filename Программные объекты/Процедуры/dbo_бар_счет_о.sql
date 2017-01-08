SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_счет_о] @счет_код INT
AS
  SET NOCOUNT ON;

  SELECT
    бар_дви.дви_код ,
    Isnull(бар_дви.дата, Getdate()) AS дата,
    Isnull(бар_дви.тов_код, 0) AS тов_код,
    Isnull(бар_дви.опер_код, 0) AS опер_код,
    Isnull(бар_дви.кол, 0) AS кол,
    Isnull(бар_дви.цена, 0) AS цена,
    Isnull(бар_дви.сумма, 0) AS сумма
  FROM
    бар_дви
  LEFT OUTER JOIN опер
    ON бар_дви.опер_код = опер.опер_код
  WHERE           ( опер.счет_код = @счет_код )
GO