CREATE TABLE [dbo].[я_нач_сум_2] (
  [услуга] [char](30) NULL,
  [усл_вид] [char](10) NULL,
  [дата_мин] [date] NULL,
  [дата_мак] [date] NULL,
  [сут] [numeric](38, 1) NULL,
  [цена] [numeric](12, 2) NULL,
  [сумма] [numeric](38, 2) NULL,
  [усл_код] [int] NOT NULL,
  [счет_код] [int] NOT NULL,
  [счет_имя] [varchar](300) NULL,
  [док] [int] NULL,
  [дата] [date] NULL,
  [хоз_имя_кор] [varchar](50) NULL,
  [хоз_имя_пол] [char](150) NULL,
  [сум_пропись] [varchar](255) NULL,
  [сут_сум] [numeric](4, 1) NULL,
  [ски_сум] [numeric](12, 2) NULL,
  [нач_сум] [numeric](12, 2) NULL
)
ON [PRIMARY]
GO