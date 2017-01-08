SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Backup_DropBox_Last]
AS
  BEGIN
      DECLARE @filepath NVARCHAR(4000)
      DECLARE @host_name NVARCHAR(4000)

      SET @host_name = Host_name()

      PRINT @host_name

      IF LEFT(@host_name, 3) = 'MAG'
        SET @filepath = N'd:\MSSQL\Backup\Hotel_2016_Mag_Last.bak'
      ELSE
        SET @filepath = N'd:\YandexDisk\BackUp\Hotel_2016_Hot_Last.bak'

      BACKUP DATABASE Hotel_2016 TO DISK = @filepath WITH INIT, COMPRESSION
  END
GO