SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/* для сводной табл из Excel \\Home\гостиница\опер_имя_свод_из_вью_с_условием.xlsx*/
CREATE VIEW [dbo].[во_нач_опер_дата]
AS
SELECT     TOP (100) PERCENT dbo.нач.опер_код, dbo.нач.дата, dbo.нач.кол, dbo.нач.дкр, dbo.нач.сут, dbo.нач.цена, dbo.нач.ски_про, dbo.нач.про_сум, 
                      dbo.нач.дкр_сум, dbo.нач.тел_сум, dbo.нач.бар_сум, dbo.нач.ски_сум, dbo.нач.у_1_сум, dbo.нач.у_2_сум, dbo.нач.у_3_сум, dbo.нач.инф_нач, 
                      dbo.нач.нач_сум, dbo.ски.ски_имя, dbo.Фс_опер_имя(dbo.нач.опер_код) AS опер_имя, dbo.опер.счет_код, dbo.мест.мест_имя AS мест
FROM         dbo.нач INNER JOIN
                      dbo.ски ON dbo.нач.ски_код = dbo.ски.ски_код INNER JOIN
                      dbo.опер ON dbo.нач.опер_код = dbo.опер.опер_код LEFT OUTER JOIN
                      dbo.мест ON dbo.нач.мест = dbo.мест.мест_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[9] 4[52] 2[20] 3) )"
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
               Bottom = 244
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ски"
            Begin Extent = 
               Top = 4
               Left = 356
               Bottom = 89
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер"
            Begin Extent = 
               Top = 113
               Left = 359
               Bottom = 228
               Right = 542
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "мест"
            Begin Extent = 
               Top = 30
               Left = 617
               Bottom = 145
               Right = 769
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
      Begin ColumnWidths = 9
         Width = 284
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
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'во_нач_опер_дата'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'во_нач_опер_дата'
GO