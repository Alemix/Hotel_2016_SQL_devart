SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create FUNCTION [dbo].[Фс_бар_сумма_счет_день] (
-- Add the parameters for the function here
@опер_код INT,
@дата    DATE)
RETURNS bigint
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @сум bigint
     

      SELECT @сум =Isnull(sum(сумма),0)
      FROM   бар_дви
      WHERE  опер_код = @опер_код and дата = @дата

     

      -- Return the result of the function
      RETURN Isnull(@сум, 0)
  END
GO