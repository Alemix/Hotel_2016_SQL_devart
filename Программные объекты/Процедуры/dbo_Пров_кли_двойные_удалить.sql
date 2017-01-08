SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Пров_кли_двойные_удалить]
AS
  BEGIN
      --select * from dbo.кли where isnull(кли_код_был,0) <> 0  
      DELETE FROM dbo.кли
      WHERE  Isnull(кли_код_был, 0) <> 0
  END
GO