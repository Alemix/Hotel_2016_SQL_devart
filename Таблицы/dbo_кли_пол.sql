CREATE TABLE [dbo].[кли_пол] (
  [пол_код] [int] IDENTITY,
  [пол_имя] [char](30) NULL,
  [пол] [char](1) NULL,
  CONSTRAINT [PK_пол] PRIMARY KEY CLUSTERED ([пол_код])
)
ON [PRIMARY]
GO