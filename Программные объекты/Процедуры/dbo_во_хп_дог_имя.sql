SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[во_хп_дог_имя]
--(@дог_код int )
(
@орг_код INT,
@хоз_код INT

)
AS
  SET NOCOUNT ON;
IF @хоз_код = 0
  SELECT 
    [дог_код],
    [дог_имя],
    [дог_дата],
    [дог_ном],
    [дог_орг],
    [дог_хоз]
  FROM
    [Hotel_2016].[dbo].[во_дог_имя]
  WHERE  дог_орг = @орг_код
ELSE
  SELECT 
    [дог_код],
    [дог_имя],
    [дог_дата],
    [дог_ном],
    [дог_орг],
    [дог_хоз]
  FROM
    [Hotel_2016].[dbo].[во_дог_имя]
  WHERE  дог_орг = @орг_код
     AND дог_хоз = @хоз_код
GO