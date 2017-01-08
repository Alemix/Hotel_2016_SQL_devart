SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_тов_о]
AS
  SET NOCOUNT ON;

 SELECT
   тов_код,
   тов,
   тов_вид,
   тов_имя
 FROM
   бар_тов
GO