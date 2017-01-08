SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_счет_сум_нач] (
-- Add the parameters for the function here
@опер_код INT)
RETURNS @сум TABLE (
  опер_код INT,
  с_про    numeric(12,2) NULL,
  с_дкр    numeric(12,2) NULL )
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @с_про numeric(12,2),
              @с_дкр numeric(12,2)

      SELECT @с_про = SUM(Isnull(про_сум, 0)),
             @с_дкр = SUM(Isnull(дкр_сум, 0))
      FROM   нач
      WHERE  ( нач.опер_код = @опер_код );

      INSERT @сум
      SELECT @опер_код,
             @с_про,
             @с_дкр;

      RETURN;
  END
GO