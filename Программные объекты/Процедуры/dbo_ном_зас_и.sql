SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ном_зас_и] (@ном_код INT,
                                   @инф_ном TEXT)
AS
  SET NOCOUNT OFF;

  UPDATE [ном]
  SET    [инф_ном] = @инф_ном
  WHERE  ( [ном_код] = @ном_код );
GO