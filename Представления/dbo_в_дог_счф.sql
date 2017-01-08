SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[в_дог_счф]
AS
SELECT        TOP (100) PERCENT dbo.орг.орг_имя, dbo.орг_хоз.орг_имя AS орг_хоз_имя, dbo.дог.дог_дата, dbo.дог.дог_ном, dbo.дог.дог_хоз, dbo.дог.дог_орг, dbo.дог.дог_вид_код, dbo.дог_вид.дог_вид_имя, 
                         dbo.дог.дог_ски, dbo.дог.дог_код, dbo.счф.счф_док, dbo.счф.счф_док_пров, dbo.счф.счф_дата, dbo.счф.счф_ном AS счф_номеров, dbo.счф.счф_сут AS счф_суток, dbo.счф.счф_сум AS счф_сум_нач, 
                         dbo.счф.счф_ски AS счф_сум_ски, dbo.счф.счф_итого AS счф_сум_итого, dbo.счф.счф_код
FROM            dbo.орг RIGHT OUTER JOIN
                         dbo.дог LEFT OUTER JOIN
                         dbo.дог_вид ON dbo.дог.дог_вид_код = dbo.дог_вид.дог_вид_код LEFT OUTER JOIN
                         dbo.орг_хоз ON dbo.дог.дог_хоз = dbo.орг_хоз.орг_код ON dbo.орг.орг_код = dbo.дог.дог_орг LEFT OUTER JOIN
                         dbo.счф ON ISNULL(dbo.дог.дог_код, 0) = ISNULL(dbo.счф.дог_код, 0)
WHERE        (YEAR(ISNULL(dbo.счф.счф_дата, CONVERT(DATE, ''))) = YEAR(GETDATE()))
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[33] 3) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "орг"
            Begin Extent = 
               Top = 14
               Left = 800
               Bottom = 144
               Right = 974
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "дог"
            Begin Extent = 
               Top = 46
               Left = 29
               Bottom = 318
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "дог_вид"
            Begin Extent = 
               Top = 215
               Left = 328
               Bottom = 311
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 172
               Left = 791
               Bottom = 302
               Right = 986
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "счф"
            Begin Extent = 
               Top = 8
               Left = 295
               Bottom = 138
               Right = 469
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
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1935
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
     ', 'SCHEMA', N'dbo', 'VIEW', N'в_дог_счф'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'    Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1560
         Alias = 2895
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
', 'SCHEMA', N'dbo', 'VIEW', N'в_дог_счф'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'в_дог_счф'
GO