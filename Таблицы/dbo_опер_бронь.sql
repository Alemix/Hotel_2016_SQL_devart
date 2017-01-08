CREATE TABLE [dbo].[опер_бронь] (
  [ном_код] [int] NOT NULL,
  [дата_зае] [date] NOT NULL,
  [кли_код] [int] NOT NULL,
  [суток] [int] NULL,
  [дата_вые] [date] NULL,
  [кол_взр] [int] NULL,
  [кол_дет] [int] NULL,
  [тур_заявка] [char](30) NULL,
  [тур_орг_код] [int] NULL,
  [тур_агент_код] [int] NULL,
  [тур_трансфер] [char](30) NULL,
  [опл_вид_код] [int] NULL,
  [опл_скидка] [int] NULL,
  [инф] [char](100) NULL,
  [тип_зае_код] [int] NULL,
  [цель_код] [int] NULL,
  CONSTRAINT [PK_опер_бронь] PRIMARY KEY CLUSTERED ([ном_код], [дата_зае], [кли_код])
)
ON [PRIMARY]
GO