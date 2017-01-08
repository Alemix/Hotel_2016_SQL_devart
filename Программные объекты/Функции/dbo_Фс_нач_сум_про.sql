SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
create FUNCTION [dbo].[Фс_нач_сум_про] (
-- Add the parameters for the function here
@опер_код int 
)

RETURNS DECIMAL(10, 0)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @сум DECIMAL(10, 0)
      
      SELECT @сум =  SUM(Isnull(про_сум, 0))
             
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код );
     
      -- Return the result of the function
      RETURN @сум
  END
GO