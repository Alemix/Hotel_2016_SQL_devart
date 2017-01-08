SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[бар_ост_н] (@ном_код INT,
                                   @тов_код INT,
                                   @кол     NUMERIC(9, 0))
AS
  SET NOCOUNT OFF;

  INSERT INTO [бар_ост]
              ([ном_код],
               [тов_код],
               [кол])
  VALUES      (@ном_код,
               @тов_код,
               @кол)
GO