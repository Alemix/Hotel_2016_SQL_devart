SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_акт_скидка]
(
  -- Add the parameters for the function here
  @счет_код INT
)
RETURNS CHAR(300)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @ски_про varchar(10)
      DECLARE @ски_сум varchar(50)
       DECLARE @ски_сум_пропись varchar(250)
	 DECLARE @акт varchar(100) -- возврат
      SELECT
        @ски_про = CONVERT(varchar(10), Isnull(ски_про, 0)),
        @ски_сум = CONVERT(varchar(50), Isnull(ски_сум, 0))
      FROM
      [dbo].[Фт_нач_опл_сум] (@счет_код)

	 set @ски_сум_пропись = [dbo].[фс_сумма_пропись_РубКоп]( @ски_сум)

      SELECT
        @акт = CASE
                 WHEN @ски_сум = '0' THEN 'Скидки нет.'
                 ELSE 'Скидка ' 
                 + rtrim(@ски_про) + '% составила ' 
                 + rtrim(@ски_сум) 
              +' ( ' +@ски_сум_пропись + ' )'
		    END

      -- Return the result of the function
      RETURN rtrim(@акт)
  END
GO