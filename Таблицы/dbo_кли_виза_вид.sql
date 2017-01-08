CREATE TABLE [dbo].[кли_виза_вид] (
  [виза_вид_код] [int] IDENTITY (0, 1),
  [виза_вид_имя] [char](30) NULL,
  [виза_тип] [char](1) NULL,
  [виза_кат] [char](10) NULL,
  CONSTRAINT [PK_виз] PRIMARY KEY CLUSTERED ([виза_вид_код])
)
ON [PRIMARY]
GO