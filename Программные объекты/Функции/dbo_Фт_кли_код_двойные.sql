SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2012/08/02
-- Description:	Кли_код двойные
-- =============================================
CREATE FUNCTION [dbo].[Фт_кли_код_двойные] (
-- Add the parameters for the function here
@ФИО VARCHAR(100))
RETURNS TABLE
AS
  RETURN
    (SELECT
       кли_код
     FROM
       dbo.кли
     WHERE  ФИО = @ФИО
        AND кли_код <> (SELECT
                          MIN(кли_код)
                        FROM
                          кли
                        WHERE  ФИО = @ФИО))
GO