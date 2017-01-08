SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_счф_имя_опл] (
-- Add the parameters for the function here
@счф_код INT)
RETURNS VARCHAR(100)
AS
  BEGIN
      DECLARE @счф_имя VARCHAR(100);

      SELECT
        @счф_имя = 
    
        + CASE
			 WHEN Isnull(счф.опл_дата, '') = '' THEN 'нет оплаты'
			 ELSE ' ОПЛАЧЕН - '+ Rtrim(CONVERT(VARCHAR, счф.опл_дата, 104))
			 END 
    
      FROM
        счф
     where  счф_код =  @счф_код

      RETURN Isnull(@счф_имя,'')
  END
GO