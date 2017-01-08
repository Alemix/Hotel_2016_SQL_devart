CREATE TABLE [dbo].[ном] (
  [ном_код] [int] NOT NULL,
  [ном_имя] [char](30) NULL,
  [НОМ] AS (case when rtrim(isnull([ном_имя],''))='' then CONVERT([char](10),isnull([ном_код],(0)),(0)) else isnull([ном_имя],'') end),
  [тип_код] [int] NULL,
  [мест] [int] NULL CONSTRAINT [DF_ном_мест] DEFAULT (0),
  [комнат] [int] NULL CONSTRAINT [DF_ном_комнат] DEFAULT (0),
  [метров] [numeric](5, 1) NULL CONSTRAINT [DF_ном_метров] DEFAULT (0),
  [инф_ном] [text] NULL,
  [цена] [decimal](10) NULL,
  [дкр] [int] NULL CONSTRAINT [DF_ном_дкр] DEFAULT (0),
  [кур] [int] NULL CONSTRAINT [DF_ном_кур] DEFAULT (0),
  [чис] [int] NULL CONSTRAINT [DF_ном_чис] DEFAULT (0),
  CONSTRAINT [PK_ном] PRIMARY KEY CLUSTERED ([ном_код])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO