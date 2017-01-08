CREATE TABLE [dbo].[бар_тов] (
  [тов_код] [int] IDENTITY,
  [тов_вид] [char](20) NULL,
  [тов_имя] [char](30) NULL,
  [тов] AS ((rtrim([тов_вид])+' - ')+rtrim([тов_имя])),
  CONSTRAINT [PK_бар_тов] PRIMARY KEY CLUSTERED ([тов_код])
)
ON [PRIMARY]
GO