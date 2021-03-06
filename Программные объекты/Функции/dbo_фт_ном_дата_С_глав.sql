﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фт_ном_дата_С_глав] (
-- Add the parameters for the function here
@дата DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT
       фт_ном_дата_С_мест_1.ном_код,
       ном_тип.тип_имя,
       фт_ном_дата_С_мест_1.мест,
       ном.ном_имя,
       ном.комнат,
       ном.метров,
       ном.инф_ном,
       ном.цена,
       ном.НОМ,
       ном.дкр
     FROM
       dbo.Фт_ном_дата_с(@дата) AS фт_ном_дата_С_мест_1
     INNER JOIN ном
       ON фт_ном_дата_С_мест_1.ном_код = ном.ном_код
     INNER JOIN ном_тип
       ON фт_ном_дата_С_мест_1.тип_код = ном_тип.тип_код)
GO