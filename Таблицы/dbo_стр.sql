CREATE TABLE [dbo].[стр] (
  [стр_код] [int] IDENTITY,
  [стр_имя] [char](50) NULL,
  [стр_имя_пол] [char](100) NULL,
  [стр_имя_бел] [char](100) NULL,
  [гражд] [char](30) NULL,
  [код] [char](3) NULL,
  [вид] [int] NULL,
  [СНГ] [bit] NULL,
  [Стр_Код_Стат_12_вэс] [int] NULL,
  [Стр_Код_Стат_4_тур] [int] NULL,
  CONSTRAINT [PK_стран] PRIMARY KEY CLUSTERED ([стр_код])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'BLR', 'SCHEMA', N'dbo', 'TABLE', N'стр', 'COLUMN', N'код'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Вид гражданства РБ=1, Там_Союз=2, остальные= 0', 'SCHEMA', N'dbo', 'TABLE', N'стр', 'COLUMN', N'вид'
GO