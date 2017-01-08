SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ном_зас_о_11]
(
@ном_код int
)
AS
  SET NOCOUNT ON;

  SELECT ном.ном_код,
       ном.ном_имя,
       ном_тип.тип_имя,
       ном.мест,
       ном.комнат,
       ном.метров,
       ном.инф_ном,
       ном.дкр,
        CASE Isnull( ном.кур, 0)
         WHEN 0 THEN 'Не курят'
         WHEN 1 THEN 'Для курящих'
       END   as кур
     

FROM   ном
       LEFT OUTER JOIN ном_тип
         ON ном.тип_код = ном_тип.тип_код
WHERE  ( ном.ном_код = @ном_код )
GO