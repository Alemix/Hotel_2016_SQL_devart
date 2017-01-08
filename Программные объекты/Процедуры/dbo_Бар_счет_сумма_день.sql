SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROCEDURE [dbo].[Бар_счет_сумма_день] (
@счет_код  INT
                                   
                                   
                                   )
AS
  SET NOCOUNT OFF;

  UPDATE [нач]
  SET    [бар_сум] = dbo.Фс_бар_сумма_счет_день(опер_код, дата)
  WHERE  нач.опер_код IN (SELECT
                            опер.опер_код
                          FROM
                            опер
                          WHERE  опер.счет_код = @счет_код)
GO