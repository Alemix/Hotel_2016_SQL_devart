CREATE TABLE [dbo].[опер_агент] (
  [агент_код] [int] IDENTITY,
  [агент_имя] [char](30) NULL,
  CONSTRAINT [PK_агент] PRIMARY KEY CLUSTERED ([агент_код])
)
ON [PRIMARY]
GO