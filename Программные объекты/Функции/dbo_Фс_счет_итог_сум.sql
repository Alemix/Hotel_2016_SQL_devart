SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:
-- =============================================
CREATE FUNCTION [dbo].[Фс_счет_итог_сум] (
-- Add the parameters for the function here
@счет_код INT )
RETURNS char(800)
AS
BEGIN
	-- Declare the return variable here

	DECLARE @док char(500)
	DECLARE @дата char(500)
	DECLARE @сум char(500)
	DECLARE @сум_про char(500)

	DECLARE @акт char(500) -- возврат


	SELECT @док = convert(char, isnull(док,0))
	,      @дата = convert(char,isnull(дата,''),104)

	FROM dbo.счет
	where счет_код = @счет_код

	SELECT @сум = нач_сум
	,      @сум_про = сум_пропись
	FROM [Hotel_2016].[dbo].[Фт_нач_опл_сум] (
	@счет_код)

	--SELECT @сум_про = dbo.фс_сумма_пропись(@сум,1)



	SELECT @акт =
	'Стоимость услуг проживания  согласно счет-фактуре '+
	rtrim(@док) +' от '+
	rtrim(@дата) +
	' с учетом предоставления скидки составила '+
	rtrim(@сум) +' ( '+
	rtrim(@сум_про) +' ).'

	-- Return the result of the function
	RETURN rtrim(@акт)
END
GO