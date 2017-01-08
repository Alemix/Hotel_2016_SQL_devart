SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE    FUNCTION [dbo].[Фс_счф_итого] (
-- Add the parameters for the function here
@счф_код INT)
RETURNS varchar(800)
AS
  BEGIN
      -- Declare the return variable here
      
      
      DECLARE @сум_про varchar(800)
      DECLARE @сум numeric(12,2)
     
      
      DECLARE @итог_про  varchar(800) -- возврат
      
SELECT   @сум =  счф_итого
FROM         счф
where счф_код = @счф_код
  
    
   

SELECT @сум_про = dbo.фс_сумма_пропись_РубКоп(@сум)
 
  

SELECT @итог_про =
 'Всего к оплате :  '+
   rtrim(@сум) +' ( '+
   rtrim(@сум_про) +' ).'
  
       -- Return the result of the function
      RETURN  rtrim(@итог_про)
  END
GO