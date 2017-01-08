SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/* для сводной табл из Excel \\Home\гостиница\опер_имя_свод_из_вью_с_условием.xlsx*/
CREATE VIEW [dbo].[во_нач_рас_вер_сум]
AS
SELECT     TOP (100) PERCENT dbo.усл.усл_имя AS услуга, SUM(dbo.v_нач.кол) AS кол, SUM(dbo.v_нач.сут) AS сут, dbo.v_нач.цена, SUM(dbo.v_нач.сумма) 
                      AS сумма, dbo.Фс_опер_имя(dbo.v_нач.опер_код) AS опер_имя, dbo.усл.усл_код
FROM         dbo.v_нач LEFT OUTER JOIN
                      dbo.усл ON dbo.v_нач.усл_код = dbo.усл.усл_код
GROUP BY dbo.усл.усл_имя, dbo.усл.усл_код, dbo.Фс_опер_имя(dbo.v_нач.опер_код), dbo.v_нач.цена
ORDER BY опер_имя, dbo.усл.усл_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "v_нач"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "усл"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 106
               Right = 430
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
         Column = 1440
         Alias = 900
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
', 'SCHEMA', N'dbo', 'VIEW', N'во_нач_рас_вер_сум'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'во_нач_рас_вер_сум'
GO