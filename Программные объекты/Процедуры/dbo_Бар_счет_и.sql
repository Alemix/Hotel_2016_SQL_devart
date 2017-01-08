SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Бар_счет_и] (@дви_код  INT,
                                    @тов_код  INT,
                                    @дата     DATE,
                                    @кол      INT,
                                    @опер_код INT,
                                    @цена     INT,
                                    @сумма    BIGINT)
AS
  SET NOCOUNT OFF;

  UPDATE [бар_дви]
  SET    [тов_код] = @тов_код,
         [дата] = @дата,
         [кол] = @кол,
         [опер_код] = @опер_код,
         [цена] = @цена,
         [сумма] = @сумма
  WHERE  ( [дви_код] = @дви_код )

-- иначе если нет изменений нет Update 
  UPDATE [нач]
  SET    [бар_сум] = dbo.Фс_бар_сумма_счет_день(опер_код, дата)
  WHERE  опер_код = @опер_код
     AND дата = @дата;
GO