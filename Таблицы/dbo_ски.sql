CREATE TABLE [dbo].[ски] (
  [ски_код] [int] IDENTITY (0, 1),
  [ски_имя] [char](30) NULL,
  CONSTRAINT [PK_ски] PRIMARY KEY CLUSTERED ([ски_код])
)
ON [PRIMARY]
GO