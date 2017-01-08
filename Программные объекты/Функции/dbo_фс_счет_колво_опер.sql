SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	колво опреация в опер для включать или нет БАЛАНС В ОПЛАТУ
-- =============================================
CREATE FUNCTION [dbo].[фс_счет_колво_опер] (
-- Add the parameters for the function here
@счет_код INT)
RETURNS INT
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @кол INT

        SELECT @кол = count(*)
        FROM   опер
        WHERE  счет_код = @счет_код
      
      RETURN Isnull(@кол, 0)

  END
GO