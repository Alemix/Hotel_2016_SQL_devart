CREATE TABLE [dbo].[пара] (
  [комп_код] [int] NULL,
  [счет_код] [int] NULL,
  [опер_код] [int] NULL,
  [счет_код_о] [int] NULL,
  [дата_зае_г] [datetime] NULL,
  [дата_вые_г] [datetime] NULL,
  [сут_г] [numeric](4, 1) NULL,
  [тип_зае_код_г] [int] NULL,
  [кол_взр_г] [int] NULL,
  [цель_код_г] [int] NULL,
  [ски_код_г] [int] NULL,
  [ски_про_г] [int] NULL,
  [счет_код_г] [int] NULL,
  [год_текущий] [int] NULL
)
ON [PRIMARY]
GO