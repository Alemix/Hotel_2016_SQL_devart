CREATE TABLE [dbo].[дог] (
  [дог_код] [int] IDENTITY,
  [дог_дата] [date] NULL,
  [дог_ном] [bigint] NULL,
  [дог_с] [date] NULL,
  [дог_по] [date] NULL,
  [дог_хоз] [int] NULL,
  [дог_орг] [int] NULL,
  [дог_вид_код] [int] NULL,
  [дог_ски] [int] NULL,
  [дог_сумма] [numeric](18, 2) NULL,
  [дог_инф] [varchar](300) NULL,
  [было] [varchar](300) NULL,
  CONSTRAINT [PK_дог] PRIMARY KEY CLUSTERED ([дог_код])
)
ON [PRIMARY]
GO