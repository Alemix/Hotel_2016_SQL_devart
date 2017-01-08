CREATE TABLE [dbo].[кли_страх_кем] (
  [страх_кем_код] [int] IDENTITY,
  [страх_кем_имя] [char](30) NULL,
  [страх_кем_стр] [char](30) NULL,
  CONSTRAINT [PK_страх_кем] PRIMARY KEY CLUSTERED ([страх_кем_код])
)
ON [PRIMARY]
GO