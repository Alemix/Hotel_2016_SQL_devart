CREATE TABLE [dbo].[бар_ост] (
  [тов_код] [int] NULL,
  [дата] [date] NULL,
  [кол] [int] NULL,
  [ном_код] [int] NULL,
  [ост_код] [int] IDENTITY,
  CONSTRAINT [PK_бар_ост_1] PRIMARY KEY CLUSTERED ([ост_код])
)
ON [PRIMARY]
GO