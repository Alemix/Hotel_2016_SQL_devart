SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	период дат с по
-- =============================================
CREATE FUNCTION [dbo].[Фс_дата_отч_с_по] (
-- Add the parameters for the function here
@дата_нач DATE,
@дата_кон DATE)
RETURNS CHAR(100)
AS
  BEGIN
      DECLARE @д_н VARCHAR(100) = CONVERT(CHAR, @дата_нач, 104)
      DECLARE @д_к VARCHAR(100) = CONVERT(CHAR, @дата_кон, 104)

      RETURN ' с ' + rtrim(@д_н) + ' по ' + rtrim(@д_к)
  END
GO