CREATE TABLE [dbo].[бар_дви] (
  [тов_код] [int] NULL,
  [дата] [date] NULL,
  [кол] [numeric](9) NULL,
  [рас] [int] NULL,
  [при] [int] NULL,
  [опер_код] [int] NULL,
  [дви_код] [int] IDENTITY,
  [цена] [bigint] NULL,
  [сумма] [bigint] NULL,
  CONSTRAINT [PK_бар_дви] PRIMARY KEY CLUSTERED ([дви_код])
)
ON [PRIMARY]
GO