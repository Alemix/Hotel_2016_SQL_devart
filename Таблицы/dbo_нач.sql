CREATE TABLE [dbo].[нач] (
  [опер_код] [int] NOT NULL,
  [дата] [date] NOT NULL,
  [нач_код] [int] IDENTITY,
  [мест] [int] NULL,
  [кол] [int] NULL,
  [дкр] [int] NULL,
  [сут] [numeric](4, 1) NULL,
  [цена] [numeric](12, 2) NULL,
  [ски_код] [int] NULL,
  [ски_про] [int] NULL,
  [про_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_про_сум] DEFAULT (0),
  [дкр_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_дкр_сум] DEFAULT (0),
  [тел_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_тел_сум] DEFAULT (0),
  [бар_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_бар_сум] DEFAULT (0),
  [ски_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_ски_сум] DEFAULT (0),
  [у_1_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_усл_1] DEFAULT (0),
  [у_2_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_усл_2] DEFAULT (0),
  [у_3_сум] [numeric](12, 2) NULL CONSTRAINT [DF_нач_усл_3] DEFAULT (0),
  [инф_нач] [text] NULL,
  [нач_сум] AS ((((((([про_сум]+[дкр_сум])+[тел_сум])+[бар_сум])+[у_1_сум])+[у_2_сум])+[у_3_сум])-[ски_сум]),
  [бл] [bit] NULL,
  CONSTRAINT [PK_нач] PRIMARY KEY CLUSTERED ([опер_код], [дата])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO