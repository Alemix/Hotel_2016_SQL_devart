CREATE TABLE [dbo].[опер_опл_вид] (
  [опл_вид_код] [int] IDENTITY,
  [опл_вид_имя] [char](30) NULL,
  CONSTRAINT [PK_опл_вид] PRIMARY KEY CLUSTERED ([опл_вид_код])
)
ON [PRIMARY]
GO