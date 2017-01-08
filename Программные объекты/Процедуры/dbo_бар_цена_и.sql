SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_цена_и] (@тов_код INT,
                                    @дата    DATE,
                                    @цена    DECIMAL(9, 0))
AS
  SET NOCOUNT OFF;

  UPDATE [бар_цена]
  SET    [цена] = @цена
  WHERE  [тов_код] = @тов_код
         AND @дата = @дата
GO