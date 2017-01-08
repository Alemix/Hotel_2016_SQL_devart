SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE VIEW [dbo].[в_Тест]
AS
SELECT MONTH(dbo.нач.дата) AS д_мес_период
	, min(dbo.нач.дата) AS дата_min
	, max(dbo.нач.дата) AS дата_max
	, SUM(dbo.нач.нач_сум) AS нач_сум
	, SUM(dbo.нач.ски_сум) AS ски_сум
	, dbo.опер.опер_код
	, SUM(dbo.нач.сут) AS сут_Период
	, MAX(dbo.опер.сут) AS сут_Всего
	, MAX(dbo.опер.кол_взр) AS кол_взр
	, MAX(dbo.опер.кол_дет) AS кол_дет
	, MAX(dbo.опер.кол_взр) + MAX(dbo.опер.кол_дет) AS кол
	, (MAX(dbo.опер.кол_взр) + MAX(dbo.опер.кол_дет)) * SUM(dbo.нач.сут) AS койко_суток
FROM dbo.нач
INNER JOIN dbo.опер
	ON dbo.нач.опер_код = dbo.опер.опер_код
GROUP BY dbo.опер.опер_код
	, MONTH(dbo.нач.дата)
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[37] 2[20] 3) )"
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
         Begin Table = "нач"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер"
            Begin Extent = 
               Top = 3
               Left = 232
               Bottom = 234
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2370
         Alias = 2160
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'в_Тест'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'в_Тест'
GO