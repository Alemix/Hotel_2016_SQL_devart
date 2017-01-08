SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_счф_исп_код] (
-- Add the parameters for the function here
@счф_код INT)
RETURNS int
AS
  BEGIN
      DECLARE @счет_код INT;

      SELECT
        @счет_код = счет_код
      FROM
        счет
      WHERE  счф_код = @счф_код

      RETURN Isnull(@счет_код, 0)
  END
GO