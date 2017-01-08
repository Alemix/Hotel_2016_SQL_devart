CREATE TABLE [dbo].[я_нач_опер_дата] (
  [дата_опер] [date] NOT NULL,
  [мест] [char](12) NULL,
  [кол] [int] NULL,
  [дкр] [int] NULL,
  [сут] [numeric](4, 1) NULL,
  [цена] [numeric](12, 2) NULL,
  [ски_про] [int] NULL,
  [про_сум] [numeric](12, 2) NULL,
  [дкр_сум] [numeric](12, 2) NULL,
  [тел_сум] [numeric](12, 2) NULL,
  [бар_сум] [numeric](12, 2) NULL,
  [ски_сум_опер] [numeric](12, 2) NULL,
  [у_1_сум] [numeric](12, 2) NULL,
  [у_2_сум] [numeric](12, 2) NULL,
  [у_3_сум] [numeric](12, 2) NULL,
  [инф_нач] [text] NULL,
  [нач_сум_опер] [numeric](19, 2) NULL,
  [ски_имя] [char](30) NULL,
  [опер_имя] [char](100) NULL,
  [счет_код] [int] NULL,
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
TEXTIMAGE_ON [PRIMARY]
GO