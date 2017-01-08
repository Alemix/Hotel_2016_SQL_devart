SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[во_счет] AS

SELECT
  dbo.счет.счет_код,
  dbo.счет.счет_имя,
  dbo.счет.док,
  dbo.счет.дата,
  dbo.счет.инф_счет,
  dbo.счет.орг_хоз_код,
  dbo.счет.орг_код,
  
  -- орг - зак
  dbo.орг.орг_имя,
  dbo.орг.орг_имя AS зак_имя,
  dbo.орг.орг_имя_пол AS зак_имя_пол,
  dbo.орг.орг_имя_кор AS зак_имя_кор,
  Rtrim(isnull(dbo.орг.преамбула, '')) AS зак_преамбула,
  Rtrim(Isnull(dbo.орг.дейст_на_осн, '')) AS зак_дейст_на_осн,
   dbo.орг.счет_номер AS зак_счет_номер,
  dbo.орг.счет_мфо AS зак_счет_мфо,
  dbo.орг.счет_банк AS зак_счет_банк,
  dbo.орг.унп AS зак_унп,
  Rtrim(Isnull(dbo.орг.город, '')) AS зак_город,
  Rtrim(Isnull(dbo.орг.адрес, '')) AS зак_адрес,
  Rtrim(Isnull(dbo.орг.рук_должность, '')) AS зак_рук_должность,
  Rtrim(Isnull(dbo.орг.рук_фио_пол, '')) AS зак_рук_фио_пол,
  Rtrim(Isnull(dbo.орг.рук_фио_кор, '')) AS зак_рук_фио_кор,
  -- орг_хоз
  dbo.орг_хоз.орг_имя AS хоз_имя,
  dbo.орг_хоз.орг_имя_1 AS хоз_имя_1,
  dbo.орг_хоз.орг_имя_2 AS хоз_имя_2,
  dbo.орг_хоз.орг_имя_3 AS хоз_имя_3,
  dbo.орг_хоз.орг_имя_4 AS хоз_имя_4,
  dbo.орг_хоз.орг_имя_пол AS хоз_имя_пол,
  Rtrim(Isnull(dbo.орг_хоз.орг_имя_кор, '')) AS хоз_имя_кор,
  dbo.орг_хоз.счет_номер AS хоз_счет_номер,
  dbo.орг_хоз.счет_мфо AS хоз_счет_мфо,
  dbo.орг_хоз.счет_банк AS хоз_счет_банк,
  dbo.орг_хоз.счет_банк_адр AS хоз_счет_банк_адр,
  dbo.орг_хоз.счет_банк_унп AS хоз_банк_унп ,
  dbo.орг_хоз.унп AS хоз_унп,
  dbo.орг_хоз.адрес AS хоз_адрес,
  dbo.орг_хоз.страна AS хоз_страна,
  dbo.орг_хоз.рук_фио_кор AS хоз_рук_фио_кор,
  dbo.орг_хоз.рук_фио_пол AS хоз_рук_фио_пол,
  dbo.орг_хоз.рук_должность AS хоз_рук_должность,
  dbo.орг_хоз.дейст_на_осн AS хоз_дейст_на_осн,
  dbo.орг_хоз.тел AS хоз_тел,
  dbo.орг_хоз.факс AS хоз_факс,
 -- суммы
 
  Rtrim(Isnull(dbo.Фс_преамбула(dbo.счет.счет_код), '')) AS преамбула,
  Rtrim(Isnull(dbo.Фс_акт_скидка(dbo.счет.счет_код), '')) AS скидка,
  Rtrim(Isnull(dbo.Фс_акт_стоим(dbo.счет.счет_код), '')) AS стоим,
  Rtrim(Isnull(dbo.Фс_акт_предолата(dbo.счет.счет_код), '')) AS предолата
FROM
  dbo.счет
LEFT OUTER JOIN dbo.орг_хоз
  ON dbo.счет.орг_хоз_код = dbo.орг_хоз.орг_код
LEFT OUTER JOIN dbo.орг
  ON dbo.счет.орг_код = dbo.орг.орг_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[21] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "счет"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 205
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг"
            Begin Extent = 
               Top = 22
               Left = 638
               Bottom = 214
               Right = 799
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 0
               Left = 350
               Bottom = 210
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 28
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1290
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
      ', 'SCHEMA', N'dbo', 'VIEW', N'во_счет'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'   SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'во_счет'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'во_счет'
GO