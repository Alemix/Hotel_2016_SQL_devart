SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ном_сост_период]
-- Add the parameters for the stored procedure here
@дата_нач DATE,
@дата_кон DATE
AS
  BEGIN
      DECLARE @дата DATE;
      DECLARE @дд INT;

      SET @дата = @дата_нач;
      SET @дд =0

      TRUNCATE TABLE ном_период

      WHILE ( @дата <= @дата_кон )
        BEGIN
            INSERT INTO ном_период
                        (дата,
                         ном_код,
                         сост)
            SELECT дата,
                   ном_код,
                   сост
            FROM   dbo.Фт_ном_сост_дата(@дата)

            SET @дд = @дд + 1
            SET @дата = Dateadd(DAY, @дд, @дата_нач);
        END
  END
GO