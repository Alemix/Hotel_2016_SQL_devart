SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_счет_все]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.счет.счет_код, dbo.счет.счет_имя, dbo.орг_хоз.орг_имя, dbo.счет.док, dbo.счет.дата, dbo.опер.ном_код, dbo.ном.НОМ, 
                      dbo.опер.дата_зае, dbo.опер.дз_ГОД, dbo.опер.дз_МЕС, dbo.опер.дата_вые, dbo.опер.сут, dbo.опер.сут_факт, RTRIM(dbo.кли.фам) 
                      + ' ' + RTRIM(dbo.кли.имя) + ' ' + RTRIM(dbo.кли.отч) AS фио, ISNULL(dbo.v_сум_нач.про_сум, 0) AS про_сум, ISNULL(dbo.v_сум_нач.дкр_сум, 0) 
                      AS дкр_сум, ISNULL(dbo.v_сум_нач.тел_сум, 0) AS тел_сум, ISNULL(dbo.v_сум_нач.бар_сум, 0) AS бар_сум, ISNULL(dbo.v_сум_нач.ски_сум, 0) 
                      AS ски_сум, ISNULL(dbo.v_сум_нач.у_1_сум, 0) AS у_1_сум, ISNULL(dbo.v_сум_нач.у_2_сум, 0) AS у_2_сум, ISNULL(dbo.v_сум_нач.у_3_сум, 0) 
                      AS у_3_сум, ISNULL(dbo.v_сум_нач.нач_сум, 0) AS нач_сум, ISNULL(dbo.v_сум_опл.опл_сум, 0) AS опл_сум, ISNULL(dbo.v_сум_нач.нач_сум, 0) 
                      - ISNULL(dbo.v_сум_опл.опл_сум, 0) AS баланс, ISNULL(dbo.v_сум_опл.о_1_сум, 0) AS о_1_сум, ISNULL(dbo.v_сум_опл.о_2_сум, 0) AS о_2_сум, 
                      ISNULL(dbo.v_сум_опл.о_3_сум, 0) AS о_3_сум, dbo.Фс_опер_имя(dbo.опер.опер_код) AS опер_имя, dbo.опер.опер_код, 
                      dbo.опер_тип_зае.тип_зае_имя AS вид
FROM         dbo.кли RIGHT OUTER JOIN
                      dbo.опер LEFT OUTER JOIN
                      dbo.ном ON dbo.опер.ном_код = dbo.ном.ном_код LEFT OUTER JOIN
                      dbo.v_сум_опл ON dbo.опер.опер_код = dbo.v_сум_опл.опер_код LEFT OUTER JOIN
                      dbo.v_сум_нач ON dbo.опер.опер_код = dbo.v_сум_нач.опер_код ON dbo.кли.кли_код = dbo.опер.кли_код LEFT OUTER JOIN
                      dbo.опер_тип_зае RIGHT OUTER JOIN
                      dbo.счет ON dbo.опер_тип_зае.тип_зае_код = dbo.счет.тип_код ON dbo.опер.счет_код = dbo.счет.счет_код LEFT OUTER JOIN
                      dbo.орг_хоз ON dbo.счет.орг_хоз_код = dbo.орг_хоз.орг_код
ORDER BY dbo.счет.счет_код, dbo.опер.опер_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[48] 2[3] 3) )"
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
         Begin Table = "опер_тип_зае"
            Begin Extent = 
               Top = 277
               Left = 835
               Bottom = 362
               Right = 996
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "счет"
            Begin Extent = 
               Top = 178
               Left = 455
               Bottom = 293
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер"
            Begin Extent = 
               Top = 7
               Left = 28
               Bottom = 334
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_сум_опл"
            Begin Extent = 
               Top = 46
               Left = 443
               Bottom = 161
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_сум_нач"
            Begin Extent = 
               Top = 2
               Left = 617
               Bottom = 117
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли"
            Begin Extent = 
               Top = 228
               Left = 241
               Bottom = 343
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 171
               Left = 768
               Bottom = 286
               Right = 929
            End
            DisplayFlags = 280
', 'SCHEMA', N'dbo', 'VIEW', N'v_счет_все'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'            TopColumn = 0
         End
         Begin Table = "ном"
            Begin Extent = 
               Top = 215
               Left = 568
               Bottom = 330
               Right = 729
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 2310
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
         Column = 3930
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
', 'SCHEMA', N'dbo', 'VIEW', N'v_счет_все'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'v_счет_все'
GO