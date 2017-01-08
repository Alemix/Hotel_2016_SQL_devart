SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[счет_о] (@счет_код INT)
AS
  SET NOCOUNT ON;

  SELECT
    счет_код,
    isnull(орг_хоз_код,0) as орг_хоз_код,
    isnull(орг_код,0) as орг_код,
    счет_имя,
    док,
    дата,
    инф_счет,
    dbo.Фс_док(1) AS док_1,
    dbo.Фс_док(2) AS док_2,
    dbo.Фс_док(3) AS док_3,
    isnull(дог_код,0) as дог_код,
    isnull(счф_код,0) as счф_код,
     isnull(тип_код ,0) as тип_код
  FROM
    счет
  WHERE  счет_код = @счет_код
GO