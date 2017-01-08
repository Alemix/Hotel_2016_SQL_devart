CREATE TABLE [dbo].[счф] (
  [счф_код] [int] IDENTITY,
  [счф_док] [int] NULL,
  [счф_дата] [date] NULL,
  [счф_док_пров] [int] NULL,
  [счф_сум] [numeric](12, 2) NULL,
  [счф_ном] [int] NULL,
  [счф_сут] [numeric](5, 1) NULL,
  [опл_дата] [date] NULL,
  [опл_док] [varchar](50) NULL,
  [счф_цена] [numeric](12, 2) NULL,
  [счф_инф] [varchar](50) NULL,
  [дог_код] [int] NULL,
  [дата_с] [date] NULL,
  [дата_по] [date] NULL,
  [счф_ски] [numeric](12, 2) NULL,
  [счф_итого] [numeric](12, 2) NULL,
  CONSTRAINT [PK_счф] PRIMARY KEY CLUSTERED ([счф_код])
)
ON [PRIMARY]
GO