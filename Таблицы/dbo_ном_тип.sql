CREATE TABLE [dbo].[ном_тип] (
  [тип_код] [int] NOT NULL,
  [тип_имя] [char](30) NULL,
  CONSTRAINT [PK_номер_тип] PRIMARY KEY CLUSTERED ([тип_код])
)
ON [PRIMARY]
GO