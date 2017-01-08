SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE  FUNCTION [dbo].[фт_ном_дата_сост_тип] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT ном_тип.тип_имя,
       фт_ном_дата_сост_1.сост
       
       
FROM   dbo.Фт_ном_дата_сост(@дата) AS фт_ном_дата_сост_1
       LEFT OUTER JOIN ном_тип
         ON фт_ном_дата_сост_1.тип_код = ном_тип.тип_код)
GO