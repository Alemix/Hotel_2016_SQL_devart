SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-05-22
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[нач_ген_опер]
-- Add the parameters for the stored procedure here
@опер_код INT
AS
  BEGIN
      DECLARE @дата_нач DATE;
      DECLARE @дата_кон DATE;
      DECLARE @кол_взр INT;
      DECLARE @про_сум numeric(12,2);
      DECLARE @дкр_сум numeric(12,2);
      DECLARE @ски_про INT;
      DECLARE @ски_вид INT


      SELECT @дата_нач = дата_зае,
             @дата_кон = дата_вые,
             @кол_взр = кол_взр,
             @про_сум = 200000,
             @дкр_сум = 100000,
             @ски_про = 5,
             @ски_вид = 1
      FROM   опер AS о
      WHERE  о.опер_код = @опер_код;
  
  EXEC Нач_ген
    @опер_код,
    @дата_нач,
    @дата_кон,
    @кол_взр,
    @про_сум,
    @дкр_сум,
    @ски_про,
    @ски_вид
   
  
   
  
  END
GO