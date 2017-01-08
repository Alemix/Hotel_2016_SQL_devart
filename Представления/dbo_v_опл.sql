SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_опл] AS

SELECT
  дата,
  0 AS опер_код,
  счет_код,
  CASE
    WHEN Isnull(опл_вид_код, 0) = 1 THEN 91
    WHEN Isnull(опл_вид_код, 0) = 2 THEN 92
    WHEN Isnull(опл_вид_код, 0) = 3 THEN 93
  END AS усл_код,
  0 AS кол,
  0 AS сут,
  опл_сум AS сумма,
  инф_опл
FROM
  опл
GO