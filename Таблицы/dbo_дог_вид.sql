CREATE TABLE [dbo].[дог_вид] (
  [дог_вид_код] [int] NOT NULL,
  [дог_вид_имя] [char](20) NULL,
  CONSTRAINT [PK_дог_вид] PRIMARY KEY CLUSTERED ([дог_вид_код])
)
ON [PRIMARY]
GO