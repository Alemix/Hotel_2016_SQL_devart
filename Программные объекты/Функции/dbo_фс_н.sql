SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	Ноль впереди числа
-- =============================================
CREATE FUNCTION [dbo].[фс_н] (
-- Add the parameters for the function here
@ч CHAR(10),
@к int 
)
RETURNS CHAR(10)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @н CHAR(10)
      DECLARE @чд int 
      DECLARE @чч char(10)  
      
     SELECT @чч = Rtrim(ltrim((isnull(@ч,''))))
      SELECT @чд = len(@чч)
      
      SELECT @н = CASE 
                    WHEN @чд > 0  THEN 
                    replicate('0',@к-@чд)+ @чч
                    
                    
                    ELSE ''
                  END

      RETURN @н
  END
GO