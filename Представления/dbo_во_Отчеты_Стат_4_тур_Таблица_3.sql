SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[во_Отчеты_Стат_4_тур_Таблица_3]
AS
SELECT        TOP (100) PERCENT SUM(dbo.в_ана_нач.нач_сум_1000) AS [Сумма тыс.руб.], SUM(dbo.в_ана_нач.кол) AS человек, SUM(dbo.в_ана_нач.сут) AS сут, SUM(dbo.в_ана_нач.койко_суток) AS [койко-суток], 
                         dbo.орг_хоз.орг_имя AS орг_хоз_имя, dbo.в_ана_нач.стр_имя AS Страна, dbo.в_ана_нач.стр_СНГ, Стр_Код_Стат_4_тур
FROM            dbo.в_ана_нач LEFT OUTER JOIN
                         dbo.орг_хоз ON dbo.в_ана_нач.орг_хоз_код = dbo.орг_хоз.орг_код
GROUP BY dbo.в_ана_нач.стр_имя, dbo.орг_хоз.орг_имя, dbo.в_ана_нач.стр_СНГ, Стр_Код_Стат_4_тур
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[29] 2[31] 3) )"
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
         Begin Table = "в_ана_нач"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 176
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 445
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
         Column = 3045
         Alias = 2175
         Table = 1875
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
', 'SCHEMA', N'dbo', 'VIEW', N'во_Отчеты_Стат_4_тур_Таблица_3'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'во_Отчеты_Стат_4_тур_Таблица_3'
GO