CREATE TABLE [dbo].[кли_пас_вид] (
  [пас_вид_код] [int] IDENTITY,
  [пас_вид_имя] [char](30) NULL,
  CONSTRAINT [PK_пас_вид] PRIMARY KEY CLUSTERED ([пас_вид_код])
)
ON [PRIMARY]
GO