CREATE TABLE [dbo].[гра] (
  [гра_код] [int] IDENTITY (0, 1),
  [гра_имя] [char](50) NULL,
  CONSTRAINT [PK_гра] PRIMARY KEY CLUSTERED ([гра_код])
)
ON [PRIMARY]
GO