SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_нач]
AS
  SELECT
    dbo.v_нач_union.дата,
    dbo.v_нач_union.опер_код,
    Isnull(dbo.опер.счет_код, 0) AS счет_код,
    dbo.v_нач_union.усл_код,
    dbo.v_нач_union.кол,
    dbo.v_нач_union.сут,
    dbo.v_нач_union.цена,
    dbo.v_нач_union.сумма
  FROM
    dbo.v_нач_union
  LEFT OUTER JOIN dbo.опер
    ON dbo.v_нач_union.опер_код = dbo.опер.опер_код
GO