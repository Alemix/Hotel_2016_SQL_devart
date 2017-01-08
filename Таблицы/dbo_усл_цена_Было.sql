CREATE TABLE [dbo].[усл_цена_Было] (
  [усл_код] [int] NOT NULL,
  [усл_дата_с] [date] NOT NULL,
  [тип_код] [int] NOT NULL,
  [цена_1] [numeric](12, 2) NULL,
  [цена_2] [numeric](12, 2) NULL,
  [цена_3] [numeric](12, 2) NULL,
  [цена_7] [numeric](12, 2) NULL,
  [усл_цена_код] [int] IDENTITY
)
ON [PRIMARY]
GO