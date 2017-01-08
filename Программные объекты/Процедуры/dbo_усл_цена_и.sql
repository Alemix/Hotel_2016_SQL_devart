SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[усл_цена_и] (@усл_цена_код INT,
@усл_код    INT,
                                     @усл_дата_с DATE,
                                     @тип_код    INT,
                                     @цена_1     numeric(12,2),
                                     @цена_2     numeric(12,2),
                                     @цена_3     numeric(12,2),
                                     @цена_7     numeric(12,2)
                                     )
AS
  SET NOCOUNT ON;

  UPDATE усл_цена
  SET    усл_код = @усл_код,
         усл_дата_с = @усл_дата_с,
         тип_код = @тип_код,
         цена_1 = @цена_1,
         цена_2 = @цена_2,
         цена_3 = @цена_3,
         цена_7 = @цена_7
  WHERE  усл_цена_код = @усл_цена_код
GO