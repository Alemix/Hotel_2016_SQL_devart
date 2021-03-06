﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-08-15
-- Description:	отч
-- =============================================
 CREATE  PROCEDURE [dbo].[о_нач_опер]
-- Add the parameters for the stored procedure here
@счет_код INT 
AS
  BEGIN
      SET NOCOUNT ON;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[я_нач_опер]') AND type in (N'U'))
DROP TABLE [dbo].[я_нач_опер]

 SELECT
   во_нач_опер.услуга,
   усл.усл_вид,
   во_нач_опер.сут,
   во_нач_опер.цена,
   во_нач_опер.сумма,
   во_нач_опер.усл_код,
   во_нач_опер.счет_код,
   во_счет.счет_имя,
   во_счет.док,
   во_счет.дата,
   во_счет.орг_имя,
   во_счет.хоз_имя_кор,
   во_счет.хоз_имя_пол,
   Фт_нач_опл_сум_1.сум_пропись,
   Фт_нач_опл_сум_1.сут AS сут_сум,
   Фт_нач_опл_сум_1.ски_сум,
   Фт_нач_опл_сум_1.нач_сум,
   во_нач_опер.опер_имя
 INTO            я_нач_опер
 FROM
   во_нач_опер
 LEFT OUTER JOIN усл
   ON во_нач_опер.усл_код = усл.усл_код
 LEFT OUTER JOIN во_счет
   ON во_нач_опер.счет_код = во_счет.счет_код
 LEFT OUTER JOIN dbo.Фт_нач_опл_сум(@счет_код) AS Фт_нач_опл_сум_1
   ON во_нач_опер.счет_код = Фт_нач_опл_сум_1.счет_код
 WHERE           ( во_нач_опер.счет_код = @счет_код ) 
 
  
   
     
     
     
     
      
  END
GO