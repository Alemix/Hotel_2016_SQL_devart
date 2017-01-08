SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[в_дог_счф_пров]
AS
SELECT        dbo.в_дог_счф.счф_док, ISNULL(пров.счф_док_Двойные, 0) AS счф_док_Двойные, dbo.в_дог_счф.счф_дата, dbo.в_дог_счф.орг_имя, dbo.в_дог_счф.счф_номеров, dbo.в_дог_счф.счф_суток, 
                         dbo.в_дог_счф.счф_сум_нач, dbo.в_дог_счф.счф_сум_ски, dbo.в_дог_счф.счф_сум_итого, dbo.в_дог_счф.дог_дата, dbo.в_дог_счф.дог_ном, dbo.в_дог_счф.дог_хоз, dbo.в_дог_счф.дог_орг, 
                         dbo.в_дог_счф.дог_код, dbo.в_дог_счф.дог_вид_код, dbo.в_дог_счф.дог_вид_имя, dbo.в_дог_счф.дог_ски, dbo.в_дог_счф.орг_хоз_имя, dbo.в_дог_счф.счф_код, 
                         dbo.в_дог_счф.счф_док_пров
FROM            dbo.в_дог_счф LEFT OUTER JOIN
                         dbo.в_пров_дог_счф_двойные AS пров ON dbo.в_дог_счф.дог_хоз = пров.дог_хоз AND dbo.в_дог_счф.счф_док = пров.счф_док
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[60] 4[18] 2[4] 3) )"
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
         Begin Table = "пров"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 302
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "в_дог_счф"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 316
               Right = 212
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
         Column = 4905
         Alias = 4005
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
', 'SCHEMA', N'dbo', 'VIEW', N'в_дог_счф_пров'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'в_дог_счф_пров'
GO