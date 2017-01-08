SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Рег_и] (@опер_код INT,
                                @рег      INT)
AS
  SET NOCOUNT OFF;

  UPDATE [опер]
  SET    [рег] = @рег
  WHERE  ( [опер_код] = @опер_код );

  SELECT
    опер_код,
    рег
  FROM
    опер
  WHERE  ( опер_код = @опер_код )
GO