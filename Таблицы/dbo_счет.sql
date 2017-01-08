CREATE TABLE [dbo].[счет] (
  [счет_код] [int] IDENTITY,
  [орг_хоз_код] [int] NULL CONSTRAINT [DF_счет_орг_хоз_код] DEFAULT (1),
  [орг_код] [int] NULL,
  [счет_имя] [varchar](300) NULL CONSTRAINT [DF_счет_счет_имя] DEFAULT (''),
  [док] [int] NULL,
  [дата] [date] NULL,
  [инф_счет] [text] NULL,
  [дог_код] [int] NULL,
  [счф_код] [int] NULL,
  [тип_код] [int] NULL,
  CONSTRAINT [PK_счет] PRIMARY KEY CLUSTERED ([счет_код])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO