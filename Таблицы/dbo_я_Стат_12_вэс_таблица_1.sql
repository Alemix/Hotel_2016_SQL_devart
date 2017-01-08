CREATE TABLE [dbo].[я_Стат_12_вэс_таблица_1] (
  [Страна] [char](50) NULL,
  [Сумма тыс.руб.] [numeric](38, 7) NULL,
  [Сумма тыс.долл.США] [numeric](38, 6) NULL,
  [орг_хоз_имя] [char](50) NULL,
  [Дата_с] [date] NULL,
  [Дата_по] [date] NULL,
  [Орг_Хоз_код] [int] NULL,
  [Курс_Долл] [numeric](10, 4) NULL,
  [Итого_тыс_руб] [numeric](10, 4) NULL,
  [Итого_тыс_долл_США] [numeric](10, 4) NULL
)
ON [PRIMARY]
GO