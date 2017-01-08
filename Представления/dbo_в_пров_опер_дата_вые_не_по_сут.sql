SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[в_пров_опер_дата_вые_не_по_сут] AS

SELECT
  опер_код,
  дата_зае,
  дата_вые,
  сут,
  Datediff(DAY, дата_зае, дата_вые) AS р_дни,
  сут_дни,
  Datediff(DAY, дата_зае, дата_вые) - сут_дни AS разн,
  пол_сут_зае,
  пол_сут_вые,
  сут_пол
FROM
  dbo.опер
WHERE  Datediff(DAY, дата_зае, дата_вые) - сут_дни <> 0
--WHERE  опер_код = 4718
GO