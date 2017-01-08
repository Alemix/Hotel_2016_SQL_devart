CREATE TABLE [dbo].[мест] (
  [мест_код] [int] NOT NULL,
  [мест_имя] [char](12) NULL,
  [кол] [int] NULL,
  [имя_полн] [char](30) NULL,
  CONSTRAINT [PK_опер_мест] PRIMARY KEY CLUSTERED ([мест_код])
)
ON [PRIMARY]
GO