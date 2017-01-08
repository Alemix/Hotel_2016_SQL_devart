CREATE TABLE [dbo].[опер_тип_зае] (
  [тип_зае_код] [int] IDENTITY,
  [тип_зае_имя] [char](5) NULL,
  CONSTRAINT [PK_с_тип_заезда] PRIMARY KEY CLUSTERED ([тип_зае_код])
)
ON [PRIMARY]
GO