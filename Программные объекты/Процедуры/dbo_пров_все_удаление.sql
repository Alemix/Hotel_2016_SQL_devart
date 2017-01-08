SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[пров_все_удаление]
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
              OR счет.счет_код NOT IN (SELECT DISTINCT опер.счет_код
                                       FROM   опер)

      DELETE 
	 	-- select *
	 FROM [dbo].[опер]
      WHERE  дата_зае IS NULL
              OR дата_вые IS NULL
              OR Isnull(ном_код, 0) = 0
              OR Isnull(кли_код, 0) = 0
              OR Isnull(счет_код, 0) = 0




  END
GO