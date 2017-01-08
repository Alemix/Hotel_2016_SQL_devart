SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE   FUNCTION [dbo].[Фс_адр_имя]
(
  -- Add the parameters for the function here
  @кли_код INT
)
RETURNS CHAR(200)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @адр_имя  CHAR(70) -- возврат

DECLARE @стр CHAR(70)
DECLARE @гор CHAR(70)
DECLARE @адр CHAR(70)


     SELECT
       @стр = isnull(стр_имя,''),
       @гор = isnull(адр_город,''),
       @адр = isnull(адрес,'')
     FROM
       кли
     LEFT OUTER JOIN стр
       ON кли.адр_страна_код = стр.стр_код
     WHERE           кли_код = @кли_код 
     
 SELECT
   @адр_имя = rtrim(@стр) + ' ' + rtrim(@гор) + ' ' + rtrim(@адр) 
   
    
    
      -- Return the result of the function
      RETURN rtrim(@адр_имя)
  END
GO