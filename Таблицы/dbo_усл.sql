CREATE TABLE [dbo].[усл] (
  [усл_код] [int] NOT NULL,
  [усл_имя] [char](30) NULL,
  [усл_вид] [char](10) NULL,
  [усл_имя_дли] [char](100) NULL,
  CONSTRAINT [PK_услуги] PRIMARY KEY CLUSTERED ([усл_код])
)
ON [PRIMARY]
GO