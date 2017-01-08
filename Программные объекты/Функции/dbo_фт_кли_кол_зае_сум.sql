SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	 с учетом переселения
-- =============================================
CREATE FUNCTION [dbo].[фт_кли_кол_зае_сум] (
-- Add the parameters for the function here
@кли_код INT)
RETURNS TABLE
AS
  RETURN
    (SELECT
      Isnull(MAX(кли_код), 0) AS кли_код,
      Isnull( COUNT(*), 0) AS кол,
      Isnull( MAX(дата_вые), 0) AS дата_вые,
      Isnull( SUM(сут), 0) AS сут
     FROM
       dbo.v_кли_кол_зае -- с учетом переселения
     WHERE  ( кли_код = @кли_код ))
GO