﻿CREATE TABLE [dbo].[я_кли] (
  [счет_код] [int] NULL,
  [кли_код] [int] NULL,
  [ном_код] [int] NULL,
  [ски_про] [int] NULL,
  [ски_код] [int] NULL,
  [рег] [int] NULL,
  [дата_зае] [datetime] NULL,
  [дата_вые] [datetime] NULL,
  [сут] [numeric](38, 1) NULL,
  [виза_сер] [char](3) NULL,
  [виза_номер] [char](30) NULL,
  [виза_вид_код] [int] NULL,
  [виза_дата_с] [date] NULL,
  [виза_дата_по] [date] NULL,
  [страх_номер] [char](30) NULL,
  [страх_кем_код] [int] NULL,
  [страх_дата_с] [date] NULL,
  [страх_дата_по] [date] NULL,
  [гра_дата] [date] NULL,
  [гра_код] [int] NULL,
  [миг_карта] [char](30) NULL,
  [миг_карта_дата_с] [date] NULL,
  [миг_карта_дата_по] [date] NULL,
  [раб_прибыл] [char](30) NULL,
  [счет_код_увед] [int] NULL,
  [кли_код_увед] [int] NULL,
  [фам] [char](30) NULL,
  [имя] [char](30) NULL,
  [отч] [char](30) NULL,
  [имя_отч] [varchar](61) NULL,
  [рожд_дата] [date] NULL,
  [др_д] [char](10) NULL,
  [др_м] [char](10) NULL,
  [др_г] [char](10) NULL,
  [пдс_д] [char](10) NULL,
  [пдс_м] [char](10) NULL,
  [пдс_г] [char](10) NULL,
  [пдп_д] [char](10) NULL,
  [пдп_м] [char](10) NULL,
  [пдп_г] [char](10) NULL,
  [дз_д] [char](10) NULL,
  [дз_м] [char](10) NULL,
  [дз_г] [char](10) NULL,
  [дв_д] [char](10) NULL,
  [дв_м] [char](10) NULL,
  [дв_г] [char](10) NULL,
  [пас_номер] [char](30) NULL,
  [гражд] [char](30) NULL,
  [пол] [char](1) NULL,
  [виза_тип] [char](1) NULL,
  [гра] [varchar](83) NULL,
  [фио_лат] [char](100) NULL,
  [фио] [char](100) NULL,
  [фам_ио] [char](100) NULL,
  [адр_имя] [char](200) NULL,
  [паспорт] [char](300) NULL,
  [виза] [char](100) NULL,
  [страх] [char](100) NULL,
  [мигр] [char](100) NULL,
  [гран] [char](100) NULL,
  [хоз_имя] [char](50) NULL
)
ON [PRIMARY]
GO