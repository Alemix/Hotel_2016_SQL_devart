SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_опл_сум_счет_вью] (
-- Add the parameters for the function here
@счет_код INT)
RETURNS @нач_сум TABLE (
  оплата CHAR(20) NULL,
  кол    INT NULL,
  сумма  numeric(12,2) NULL )
AS
  BEGIN
      INSERT @нач_сум
      SELECT усл.усл_имя        AS оплата,
             COUNT(v_опл.сумма) AS кол,
             isnull(SUM(v_опл.сумма),0)   AS сумма
      FROM   усл
             RIGHT OUTER JOIN v_опл
               ON усл.усл_код = v_опл.усл_код
      GROUP  BY усл.усл_имя,
                v_опл.счет_код
      HAVING ( v_опл.счет_код = @счет_код )

      INSERT @нач_сум
      SELECT 'Итого оплата'        AS оплата,
             COUNT(v_опл.сумма) AS кол,
             isnull(SUM(v_опл.сумма),0)   AS сумма
      FROM   v_опл
             
     where ( v_опл.счет_код = @счет_код )


      RETURN;
  END
GO