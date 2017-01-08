SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ном_о]
AS
  SET NOCOUNT ON;

  SELECT ном.ном_код,
         ном_тип.тип_имя,
         ном.ном_имя,
         ном.мест,
         ном.комнат,
         ном.метров,
         ном.инф_ном,
         ном.цена,
         ном.дкр,
         ном.кур,
         ном.чис,
         ном.тип_код
  FROM   ном
         LEFT OUTER JOIN ном_тип
           ON ном.тип_код = ном_тип.тип_код
GO