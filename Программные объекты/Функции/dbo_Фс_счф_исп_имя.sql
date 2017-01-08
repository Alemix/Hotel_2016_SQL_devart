SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_счф_исп_имя] (
-- Add the parameters for the function here
@счф_код INT)
RETURNS VARCHAR(100)
AS
  BEGIN
      DECLARE @счф_имя VARCHAR(100);
 DECLARE @счет_код int;
   
    SELECT
        @счет_код = isnull(счет_код,0)
      FROM
       счет 
     where  счф_код =  @счф_код
     
      SELECT @счф_имя =
       isnull( dbo.Фс_счет_имя(@счет_код),'Нет')
     
      RETURN @счф_имя
  END
GO