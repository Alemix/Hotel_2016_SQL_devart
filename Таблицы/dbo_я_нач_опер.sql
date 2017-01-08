CREATE TABLE [dbo].[я_нач_опер] (
  [услуга] [char](100) NULL,
  [усл_вид] [char](10) NULL,
  [сут] [numeric](38, 1) NULL,
  [цена] [numeric](12, 2) NULL,
  [сумма] [numeric](38, 2) NULL,
  [усл_код] [int] NULL,
  [счет_код] [int] NOT NULL,
  [счет_имя] [varchar](300) NULL,
  [док] [int] NULL,
  [дата] [date] NULL,
  [орг_имя] [varchar](300) NULL,
  [хоз_имя_кор] [varchar](50) NULL,
  [хоз_имя_пол] [char](150) NULL,
  [сум_пропись] [varchar](255) NULL,
  [сут_сум] [numeric](4, 1) NULL,
  [ски_сум] [numeric](12, 2) NULL,
  [нач_сум] [numeric](12, 2) NULL,
  [опер_имя] [char](100) NULL
)
ON [PRIMARY]
GO