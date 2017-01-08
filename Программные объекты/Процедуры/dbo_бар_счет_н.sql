SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_счет_н] (@тов_код  INT,
                                    @дата     DATE,
                                    @кол     INT,
                                 
                                    @опер_код INT,
                                    @цена     bigINT,
                                    @сумма    bigINT)
AS
  SET NOCOUNT OFF;

  INSERT INTO [бар_дви]
              ([тов_код],
               [дата],
               [кол],
               
               [опер_код],
               [цена],
               [сумма])
  VALUES      (@тов_код,
               @дата,
               @кол,
             
               @опер_код,
               @цена,
               @сумма )
GO