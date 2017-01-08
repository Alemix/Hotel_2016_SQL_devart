SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[BackUp_DropBox_дата]
AS
  BEGIN
      DECLARE @filepath NVARCHAR(4000)
      DECLARE @host_name NVARCHAR(4000)

      SET @host_name = Host_name()

      PRINT @host_name

      IF LEFT(@host_name, 3) = 'MAG'
        SET @filepath = N'd:\MSSQL\Backup\Hotel_2016_Mag_' + REPLACE(CONVERT(NVARCHAR(10), Getdate(), 102), '.', '_') + '_' + REPLACE(CONVERT(NVARCHAR(5), Getdate(), 108), ':', '_') + '.bak'
      ELSE
        SET @filepath = N'd:\YandexDisk\BackUp\Hotel_2016_Hot_' + REPLACE(CONVERT(NVARCHAR(10), Getdate(), 102), '.', '_') + '_' + REPLACE(CONVERT(NVARCHAR(5), Getdate(), 108), ':', '_') + '.bak'

      BACKUP DATABASE Hotel_2016 TO DISK = @filepath WITH INIT, COMPRESSION
  END
GO