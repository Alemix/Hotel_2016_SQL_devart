﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[пров_все]
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DELETE 
	 	-- select *
	 FROM [dbo].[счет]
      WHERE  Isnull(счет_код, 0) = 0
              OR Isnull(счет_имя, '') = ''
                OR Isnull(орг_хоз_код, '') = ''
              OR счет.счет_код NOT IN (SELECT DISTINCT опер.счет_код
                                       FROM   опер)

      -- OR Isnull(счет_имя, '') = ''
      DELETE 
	  	-- select *
	 FROM [dbo].[кли]
      WHERE  Isnull(кли_код, 0) = 0
              OR Isnull(фам, '') = ''

      DELETE 
	  	-- select *
	 FROM [dbo].[опер]
      WHERE  дата_зае IS NULL
              OR дата_вые IS NULL
              OR Isnull(ном_код, 0) = 0
              OR Isnull(кли_код, 0) = 0
              OR Isnull(счет_код, 0) = 0

      UPDATE кли
      SET    фам = Isnull(фам, ''),
             имя = Isnull(имя, ''),
             отч = Isnull(отч, '')
      WHERE  фам IS NULL
              OR имя IS NULL
              OR отч IS NULL

      UPDATE кли
      SET    адр_страна_код = Isnull(гражд_код, 0)
      WHERE  адр_страна_код IS NULL

      EXEC dbo.Пров_дог
      
      
  END
GO