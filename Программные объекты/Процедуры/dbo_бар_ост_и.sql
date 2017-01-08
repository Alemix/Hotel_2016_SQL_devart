SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_ост_и] (@ост_код INT,
                                   @ном_код INT,
                                   @тов_код INT,
                                   @кол     NUMERIC(9, 0))
AS
  SET NOCOUNT OFF;

  UPDATE [Hotel_2016].[dbo].[бар_ост]
  SET    [тов_код] = @тов_код,
         [кол] = @кол,
         [ном_код] = @ном_код
  WHERE  ост_код = @ост_код
GO