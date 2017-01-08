CREATE TABLE [dbo].[опл] (
  [счет_код] [int] NOT NULL,
  [опл_код] [int] IDENTITY,
  [дата] [datetime] NULL,
  [опл_сум] [numeric](12, 2) NULL,
  [опл_вид_код] [int] NULL,
  [инф_опл] [text] NULL,
  CONSTRAINT [PK_опл_1] PRIMARY KEY CLUSTERED ([опл_код]),
  CONSTRAINT [FK_опл_опер_опл_вид] FOREIGN KEY ([опл_вид_код]) REFERENCES [dbo].[опер_опл_вид] ([опл_вид_код])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO