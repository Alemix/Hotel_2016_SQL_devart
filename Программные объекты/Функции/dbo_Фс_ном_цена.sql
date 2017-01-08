SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[Фс_ном_цена] (
-- Add the parameters for the function here
@ном_код INT,
@дата    DATE,
@усл_код INT,
@мест    INT)
RETURNS DECIMAL(10, 0)
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @цена DECIMAL(10, 0)
      DECLARE @тип_код INT
      DECLARE @усл_дата DATE

      SELECT @тип_код = тип_код
      FROM   ном
      WHERE  ( ном_код = @ном_код )

      SELECT @усл_дата = MAX(усл_дата_с)
      FROM   усл_цена
      WHERE  усл_дата_с <= @дата
             AND усл_код = @усл_код
             AND тип_код = @тип_код

     SELECT @цена = CASE
                      WHEN @мест = 1 THEN Isnull(цена_1, 0)
                      WHEN @мест = 2 THEN Isnull(цена_2, 0)
                      WHEN @мест = 3 THEN Isnull(цена_3, 0)
                      WHEN @мест = 7 THEN Isnull(цена_7, 0)
                      ELSE 0
                    END
     FROM   усл_цена
     WHERE  ( усл_код = @усл_код
              AND тип_код = @тип_код
              AND усл_дата_с = @усл_дата ); 
     

      -- Return the result of the function
      RETURN Isnull(@цена, 0)
  END
GO