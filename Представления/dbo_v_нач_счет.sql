SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_нач_счет]
AS
SELECT     TOP (100) PERCENT dbo.v_нач.дата, dbo.усл.усл_имя, dbo.v_нач.кол, dbo.v_нач.сут, dbo.v_нач.цена, dbo.v_нач.сумма, dbo.счет.счет_имя, 
                      dbo.счет.док, dbo.счет.дата AS док_дата, dbo.счет.инф_счет, dbo.орг_хоз.орг_имя_1, dbo.орг_хоз.орг_имя_3, dbo.орг_хоз.орг_имя_2, 
                      dbo.v_нач.опер_код, dbo.v_нач.счет_код, dbo.v_нач.усл_код
FROM         dbo.орг_хоз RIGHT OUTER JOIN
                      dbo.счет ON dbo.орг_хоз.орг_код = dbo.счет.орг_код RIGHT OUTER JOIN
                      dbo.v_нач ON dbo.счет.счет_код = dbo.v_нач.счет_код LEFT OUTER JOIN
                      dbo.усл ON dbo.v_нач.усл_код = dbo.усл.усл_код
ORDER BY dbo.v_нач.опер_код, dbo.v_нач.дата
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[46] 2[11] 3) )"
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
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 228
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "счет"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 195
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_нач"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 176
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "усл"
            Begin Extent = 
               Top = 126
               Left = 663
               Bottom = 226
               Right = 815
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
      Begin ColumnWidths = 14
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy', 'SCHEMA', N'dbo', 'VIEW', N'v_нач_счет'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N' = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'v_нач_счет'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'v_нач_счет'
GO