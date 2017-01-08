SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фс_преамбула_орг] (
-- Add the parameters for the function here
@орг_код INT)
RETURNS VARCHAR(1000)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @пре VARCHAR(1000)
      
      
      SELECT
        @пре = 
          Rtrim(dbo.Фс_орг_имя_пол(@орг_код)) 
      + ' именуемый в дальнейшем «Заказчик»,' 
        + ' в лице ' 
        + lower(Rtrim(dbo.Фс_орг_рук_должность(@орг_код)))+ ' '
        + Rtrim(dbo.Фс_орг_рук_фио_пол(@орг_код)) + ' действующего на основании '
        + Rtrim(dbo.Фс_орг_дейст_на_осн(@орг_код))+ ' '

      -- надо в SELECT  rtrim(dbo.Фс_преамбула (208))
      -- кекшь не работает !!!
      RETURN Rtrim(@пре)
  END
GO