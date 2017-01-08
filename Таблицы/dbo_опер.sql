CREATE TABLE [dbo].[опер] (
  [опер_код] [int] IDENTITY,
  [ном_код] [int] NULL CONSTRAINT [DF_опер_ном_код] DEFAULT (0),
  [кли_код] [int] NULL CONSTRAINT [DF_опер_кли_код] DEFAULT (0),
  [кли_код_был] [int] NULL,
  [счет_код] [int] NULL CONSTRAINT [DF_опер_счет_код] DEFAULT (0),
  [дата_зае] [datetime] NULL,
  [дз_ГОД] AS (datepart(year,[дата_зае])),
  [дз_МЕС] AS (datepart(month,[дата_зае])),
  [дата_вые] [datetime] NULL,
  [пол_сут_зае] [bit] NULL,
  [пол_сут_вые] [bit] NULL,
  [дата_вые_факт] [datetime] NULL,
  [сут] [numeric](4, 1) NULL CONSTRAINT [DF_опер_сут] DEFAULT (0),
  [сут_дни] [int] NULL,
  [сут_пол] AS (case when isnull([пол_сут_зае],(0))=(0) then (0) else (0.5) end+case when isnull([пол_сут_вые],(0))=(0) then (0) else (0.5) end),
  [сут_факт] [numeric](4, 1) NULL CONSTRAINT [DF_опер_сут_факт] DEFAULT (0),
  [кол_взр] [int] NULL CONSTRAINT [DF_опер_кол_взр] DEFAULT (0),
  [кол_дет] [int] NULL CONSTRAINT [DF_опер_кол_дет] DEFAULT (0),
  [рег] [int] NULL CONSTRAINT [DF_опер_рег] DEFAULT (0),
  [рег_пров] [int] NULL,
  [тип_зае_код] [int] NULL CONSTRAINT [DF_опер_тип_зае_код] DEFAULT (1),
  [цель_код] [int] NULL CONSTRAINT [DF_опер_цель_код] DEFAULT (1),
  [ски_код] [int] NULL CONSTRAINT [DF_опер_ски_код] DEFAULT (0),
  [ски_про] [int] NULL CONSTRAINT [DF_опер_ски_про] DEFAULT (0),
  [инф_зае] [text] NULL,
  [инф_вые] [text] NULL,
  [раб_место] [char](30) NULL,
  [раб_должность] [char](30) NULL,
  [раб_ком_уд] [char](30) NULL,
  [раб_прибыл] [char](30) NULL,
  [виза_вид_код] [int] NULL,
  [виза_сер] [char](3) NULL CONSTRAINT [DF_опер_виза_сер] DEFAULT ('BLR'),
  [виза_номер] [char](30) NULL,
  [виза_дата_с] [date] NULL,
  [виза_дата_по] [date] NULL,
  [страх_кем_код] [int] NULL,
  [страх_номер] [char](30) NULL,
  [страх_дата_с] [date] NULL,
  [страх_дата_по] [date] NULL,
  [миг_карта] [char](30) NULL,
  [миг_карта_дата_с] [date] NULL,
  [миг_карта_дата_по] [date] NULL,
  [гра_дата] [date] NULL,
  [гра_код] [int] NULL,
  [цена] [bigint] NULL,
  [дата_соз] [datetime] NULL,
  [дата_изм] [datetime] NULL,
  [цена_изм] [bit] NULL,
  [рег_был] [int] NULL,
  CONSTRAINT [PK_опер] PRIMARY KEY CLUSTERED ([опер_код])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [дата_зае_кол_заездов]
  ON [dbo].[опер] ([дата_зае])
  INCLUDE ([кли_код], [счет_код], [дата_вые], [сут], [рег])
  ON [PRIMARY]
GO

CREATE INDEX [счет_код_опер]
  ON [dbo].[опер] ([счет_код])
  INCLUDE ([опер_код])
  ON [PRIMARY]
GO