SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Пров_рег_все_выполнить]
-- Add the parameters for the stored procedure here
@дата_нач DATE,
@дата_кон DATE
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE опер
      SET    рег = рег_пров
      WHERE  ( дата_зае >= @дата_нач
           AND дата_зае <= @дата_кон
           AND рег <> рег_пров )
  END
GO