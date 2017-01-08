CREATE TABLE [dbo].[опер_цель] (
  [цель_код] [int] IDENTITY,
  [цель_имя] [char](30) NULL,
  CONSTRAINT [PK_цель] PRIMARY KEY CLUSTERED ([цель_код])
)
ON [PRIMARY]
GO