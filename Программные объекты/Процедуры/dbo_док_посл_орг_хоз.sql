SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-05-22
-- Description:	
-- =============================================
create  PROCEDURE [dbo].[док_посл_орг_хоз]
-- Add the parameters for the stored procedure here
@орг_хоз_код int
AS
  BEGIN
      DECLARE @док INT;
      
     select @док=dbo.Фс_док(@орг_хоз_код)
     
 Return @док    
 END
GO