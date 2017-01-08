CREATE TABLE [dbo].[бар_цена] (
  [тов_код] [int] NOT NULL,
  [дата] [date] NOT NULL,
  [цена] [numeric](9) NULL,
  CONSTRAINT [IX_бар_цена] UNIQUE ([тов_код], [дата])
)
ON [PRIMARY]
GO