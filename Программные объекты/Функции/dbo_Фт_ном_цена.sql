SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[Фт_ном_цена] (
-- Add the parameters for the function here
@ном_код INT,
@дата    DATE,
@усл_код INT)
RETURNS @цены TABLE (
  цена_1 numeric(12,2) NULL,
  цена_2 numeric(12,2) NULL,
  цена_3 numeric(12,2) NULL,
  цена_7 numeric(12,2) NULL )
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @тип_код INT;
      DECLARE @цена_1 numeric(12,2),
              @цена_2 numeric(12,2),
              @цена_3 numeric(12,2),
              @цена_7 numeric(12,2)

      SELECT @тип_код = тип_код
      FROM   ном
      WHERE  ( ном_код = @ном_код )

      SELECT @цена_1 = isnull(цена_1,0),
             @цена_2 = isnull(цена_2,0),
             @цена_3 = isnull(цена_3,0),
             @цена_7 = isnull(цена_7,0)
      FROM   усл_цена
      WHERE  ( усл_код = @усл_код
               AND тип_код = @тип_код
               AND @дата >= усл_дата_с );

      INSERT @цены
      SELECT @цена_1,
             @цена_2,
             @цена_3,
             @цена_7;
      RETURN;
  END
GO