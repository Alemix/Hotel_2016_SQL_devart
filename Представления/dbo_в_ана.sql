SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[в_ана]
AS
SELECT        dbo.опер.опер_код, dbo.счет.тип_код, dbo.опер_тип_зае.тип_зае_имя, dbo.ном.НОМ, dbo.ном_тип.тип_имя AS ном_тип_имя, dbo.кли.ФИО, dbo.опер.дз_ГОД, dbo.опер.дз_МЕС, dbo.опер.дата_зае, 
                         dbo.опер.дата_вые, dbo.опер.сут AS Суток, dbo.опер.кол_взр + dbo.опер.кол_дет AS [Кол-во], dbo.орг_хоз.орг_имя AS орг_хоз_имя, dbo.счет.орг_хоз_код, dbo.орг.орг_имя, dbo.орг.орг_имя_пол, 
                         dbo.орг.орг_имя_кор, dbo.стр.стр_имя, dbo.стр.стр_код, dbo.v_сум_нач.ски_сум AS сум_Скидки, dbo.v_сум_нач.нач_сум + dbo.v_сум_нач.ски_сум AS сум_Всего, dbo.v_сум_нач.нач_сум AS сум_Нач, 
                         dbo.v_сум_опл.опл_сум AS сум_Опл, dbo.v_сум_опл.о_1_сум AS сум_Опл_Нал, dbo.v_сум_опл.о_2_сум AS сум_Опл_бн, dbo.v_сум_опл.о_3_сум AS сум_Опл_Счет, dbo.счет.счет_имя, 
                         dbo.счет.док AS счет_док, dbo.счет.дата AS счет_дата, dbo.дог.дог_дата, dbo.дог.дог_ном, dbo.счф.счф_дата, dbo.счф.счф_док, dbo.счф.счф_сум, dbo.счф.счф_ном, dbo.счф.счф_сут
FROM            dbo.счф RIGHT OUTER JOIN
                         dbo.орг_хоз RIGHT OUTER JOIN
                         dbo.орг RIGHT OUTER JOIN
                         dbo.опер_тип_зае RIGHT OUTER JOIN
                         dbo.счет ON dbo.опер_тип_зае.тип_зае_код = dbo.счет.тип_код LEFT OUTER JOIN
                         dbo.дог ON dbo.счет.дог_код = dbo.дог.дог_код ON dbo.орг.орг_код = dbo.счет.орг_код ON dbo.орг_хоз.орг_код = dbo.счет.орг_хоз_код ON dbo.счф.счф_код = dbo.счет.счф_код RIGHT OUTER JOIN
                         dbo.опер LEFT OUTER JOIN
                         dbo.кли ON dbo.опер.кли_код = dbo.кли.кли_код LEFT OUTER JOIN
                         dbo.v_сум_нач ON dbo.опер.опер_код = dbo.v_сум_нач.опер_код LEFT OUTER JOIN
                         dbo.v_сум_опл ON dbo.опер.опер_код = dbo.v_сум_опл.опер_код ON dbo.счет.счет_код = dbo.опер.счет_код LEFT OUTER JOIN
                         dbo.ном LEFT OUTER JOIN
                         dbo.ном_тип ON dbo.ном.тип_код = dbo.ном_тип.тип_код ON dbo.опер.ном_код = dbo.ном.ном_код LEFT OUTER JOIN
                         dbo.стр ON dbo.кли.адр_страна_код = dbo.стр.стр_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[63] 4[9] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[55] 4[9] 3) )"
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
         Configuration = "(H (1[71] 3) )"
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
         Configuration = "(H (1[42] 4[11] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[70] 4) )"
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
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "кли"
            Begin Extent = 
               Top = 84
               Left = 1084
               Bottom = 389
               Right = 1276
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "опер"
            Begin Extent = 
               Top = 12
               Left = 13
               Bottom = 534
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_сум_нач"
            Begin Extent = 
               Top = 311
               Left = 516
               Bottom = 637
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_сум_опл"
            Begin Extent = 
               Top = 352
               Left = 280
               Bottom = 573
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "счф"
            Begin Extent = 
               Top = 21
               Left = 1301
               Bottom = 364
               Right = 1475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 505
               Left = 1125
               Bottom = 834
               Right = 1320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "дог"
            Begin Extent = 
               Top = 321
               Left = 711
               Bottom = 628
               Right = 885
            End
            DisplayFlags = 280
    ', 'SCHEMA', N'dbo', 'VIEW', N'в_ана'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'        TopColumn = 3
         End
         Begin Table = "счет"
            Begin Extent = 
               Top = 31
               Left = 276
               Bottom = 304
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг"
            Begin Extent = 
               Top = 127
               Left = 522
               Bottom = 257
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ном"
            Begin Extent = 
               Top = 19
               Left = 753
               Bottom = 308
               Right = 927
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ном_тип"
            Begin Extent = 
               Top = 394
               Left = 925
               Bottom = 541
               Right = 1099
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "стр"
            Begin Extent = 
               Top = 378
               Left = 1319
               Bottom = 546
               Right = 1493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер_тип_зае"
            Begin Extent = 
               Top = 5
               Left = 522
               Bottom = 101
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 41
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3150
         Width = 1665
         Width = 1425
         Width = 2910
         Width = 3375
         Width = 2355
         Width = 2940
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2490
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
         Column = 3870
         Alias = 2160
         Table = 1590
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
', 'SCHEMA', N'dbo', 'VIEW', N'в_ана'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'в_ана'
GO