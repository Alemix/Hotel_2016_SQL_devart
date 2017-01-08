SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_ном_сум_дата] (
-- Add the parameters for the function here
@дата date )
RETURNS @ном_сум TABLE (

  тип CHAR(20) NULL,
  сво    int NULL,
  зан    int NULL,
  все   int NULL)
  
AS
  BEGIN

  INSERT @ном_сум
     SELECT тип_имя,
       SUM(cво) AS cво,
       SUM(зан) AS зан,
 SUM(зан)+ SUM(cво) AS все

FROM   dbo.Фт_ном_дата_сост_тип_табл(@дата) AS фт
GROUP  BY тип_имя 
order by тип_имя



  INSERT @ном_сум
     SELECT тип_имя = 'Всего',
       cво = SUM(cво) ,
       зан = SUM(зан) ,
 все = SUM(зан)+ SUM(cво)  

FROM   dbo.Фт_ном_дата_сост_тип_табл(@дата) AS фт



      RETURN;
  END
GO