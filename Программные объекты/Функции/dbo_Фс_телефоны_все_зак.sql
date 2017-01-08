SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[Фс_телефоны_все_зак]
(
  -- Add the parameters for the function here
  @орг_код INT
)
RETURNS varCHAR(1000)
AS
  BEGIN
      -- Declare the return variable here
  
      DECLARE @тел varCHAR(1000) =''

      SELECT
        @тел  = @тел 

+ case when isnull(тел_факс,'')= '' then '' else ' факс. '+ rtrim(тел_факс) end 
+ case when isnull(тел_гор,'')= '' then '' else ' тел.гор. '+ rtrim(тел_гор) end 
+ case when isnull(тел_Velcom,'')= '' then '' else ' тел.Vel. '+ rtrim(тел_Velcom) end 
+ case when isnull(тел_MTC,'')= '' then '' else ' тел.MTC. '+ rtrim(тел_MTC) end 
+ case when isnull(тел_Life,'')= '' then '' else ' тел.Lif. '+ rtrim(тел_Life) end 
         
      FROM dbo.орг
      where  орг_код =  @орг_код
        
      RETURN @тел
  END
/*  SELECT
        @гра_стр = гражд
      FROM
        стр
      WHERE  Isnull(стр_код, 1) = Isnull(@гражд_код, 1) */
GO