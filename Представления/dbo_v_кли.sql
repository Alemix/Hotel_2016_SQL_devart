SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_кли]
AS
SELECT     dbo.кли.кли_код, dbo.кли.ФИО, dbo.кли.фам, dbo.кли.имя, dbo.кли.отч, dbo.кли.рег, dbo.кли_пол.пол_имя, dbo.кли.рожд_дата, 
                      dbo.кли.рожд_место, dbo.кли.раб_место, dbo.кли.раб_должность, dbo.кли.раб_ком_уд, dbo.кли.раб_прибыл, dbo.кли_пас_вид.пас_вид_имя, 
                      dbo.кли.пас_номер, dbo.кли.пас_дата, dbo.кли.пас_выдан, dbo.кли.адр_город, стр_адр.стр_имя, dbo.кли.адрес, dbo.кли.телефон, 
                      dbo.кли.е_маил, dbo.кли.авто_номер, dbo.кли.авто_марка, dbo.кли.инф_кли, dbo.кли_виза_вид.виза_вид_имя, dbo.кли.виза_сер, 
                      dbo.кли.виза_номер, dbo.кли.виза_дата_с, dbo.кли.виза_дата_по, dbo.кли.страх_кем_код, dbo.кли.страх_номер, dbo.кли.страх_дата_с, 
                      dbo.кли.страх_дата_по, dbo.кли_страх_кем.страх_кем_имя, dbo.кли_страх_кем.страх_кем_стр, стр_граж.гражд, dbo.кли.гра_дата, 
                      dbo.гра.гра_имя, dbo.кли.миг_карта_дата_с, dbo.кли.миг_карта_дата_по, dbo.кли.скид_карта, dbo.кли.скид_проц, dbo.кли.фам_лат, 
                      dbo.кли.имя_лат, dbo.кли.отч_лат
FROM         dbo.кли INNER JOIN
                      dbo.гра ON dbo.кли.гра_код = dbo.гра.гра_код INNER JOIN
                      dbo.кли_пол ON dbo.кли.пол = dbo.кли_пол.пол_код LEFT OUTER JOIN
                      dbo.кли_страх_кем ON dbo.кли.страх_кем_код = dbo.кли_страх_кем.страх_кем_код LEFT OUTER JOIN
                      dbo.стр AS стр_адр ON dbo.кли.адр_страна_код = стр_адр.стр_код LEFT OUTER JOIN
                      dbo.стр AS стр_граж ON dbo.кли.гражд_код = стр_граж.стр_код LEFT OUTER JOIN
                      dbo.кли_пас_вид ON dbo.кли.пас_вид_код = dbo.кли_пас_вид.пас_вид_код LEFT OUTER JOIN
                      dbo.кли_виза_вид ON dbo.кли.виза_вид_код = dbo.кли_виза_вид.виза_вид_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[45] 2[21] 3) )"
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
         Begin Table = "кли"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 414
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "гра"
            Begin Extent = 
               Top = 6
               Left = 979
               Bottom = 91
               Right = 1131
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_пол"
            Begin Extent = 
               Top = 6
               Left = 789
               Bottom = 91
               Right = 941
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_страх_кем"
            Begin Extent = 
               Top = 340
               Left = 553
               Bottom = 435
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "стр_адр"
            Begin Extent = 
               Top = 163
               Left = 548
               Bottom = 278
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "стр_граж"
            Begin Extent = 
               Top = 10
               Left = 354
               Bottom = 125
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_пас_вид"
            Begin Extent = 
               Top = 46
               Left = 599
               Bottom = 126
               Right = 751
            End
            DisplayFlags = 280', 'SCHEMA', N'dbo', 'VIEW', N'v_кли'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'
            TopColumn = 0
         End
         Begin Table = "кли_виза_вид"
            Begin Extent = 
               Top = 250
               Left = 758
               Bottom = 330
               Right = 912
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
      Begin ColumnWidths = 11
         Column = 3600
         Alias = 900
         Table = 5025
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
', 'SCHEMA', N'dbo', 'VIEW', N'v_кли'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'v_кли'
GO