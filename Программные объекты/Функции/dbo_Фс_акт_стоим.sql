SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_акт_стоим] (
	-- Add the parameters for the function here
	@счет_код INT
	)
RETURNS CHAR(800)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @док CHAR(500)
	DECLARE @дата CHAR(500)
	DECLARE @сум numeric(12,2)
	DECLARE @всего_сум numeric(12,2)
	DECLARE @сум_про CHAR(500)
	DECLARE @счф_код INT
	DECLARE @счф_имя CHAR(500)
	DECLARE @акт CHAR(500) -- возврат

	SELECT @док = convert(CHAR, isnull(док, 0))
		,@дата = convert(CHAR, isnull(дата, ''), 104)
		,@счф_код = счет.счф_код
	FROM dbo.счет
	WHERE счет_код = @счет_код

	SELECT @сум = нач_сум
		,@всего_сум = всего_сум,
		@сум_про = сум_пропись
	FROM [Hotel_2016].[dbo].[Фт_нач_опл_сум](@счет_код)

	

	SELECT @счф_имя = isnull(rtrim(dbo.Фс_счф_имя_акт(@счф_код)), '№ ___ от _____________')

	SELECT @акт = 'Стоимость услуг проживания ' + ' с учетом предоставления скидки составила ' + rtrim(@сум) + ' ( ' + rtrim(@сум_про) + ' )'

	-- Return the result of the function
	RETURN rtrim(@акт)
END
	/*
было до 01/08/2012
SELECT @акт =
 'Стоимость услуг проживания  согласно счет-фактуре '+
  rtrim(@счф_имя) +
  ' с учетом предоставления скидки составила '+
   rtrim(@сум) +' ( '+
   rtrim(@сум_про) +' белорусских рублей).'
 
*/
GO