SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	 с учетом переселения для отчета  с указанием периода
-- =============================================
create FUNCTION [dbo].[Фт_кол_зае] (
-- Add the parameters for the function here
@кли_код INT,
@дата_с  DATE,
@дата_по DATE)
RETURNS TABLE
AS
  RETURN
    (SELECT
       isnull(MAX(кли_код),0) AS кли_код,
       COUNT(*) AS кол,
       
       SUM(сут) AS сут
     FROM
       dbo.v_кли_кол_зае -- с учетом переселения
     WHERE  ( кли_код = @кли_код )
     and 
      (дата_зае >= @дата_с AND дата_вые <= @дата_по) 
     
     
     )
GO