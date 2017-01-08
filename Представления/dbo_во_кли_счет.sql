SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/* один клиент на опер - без учета  переселений*/
CREATE VIEW [dbo].[во_кли_счет] AS

SELECT TOP (100) PERCENT
  счет_код,
  кли_код,
  MAX(ном_код) AS ном_код,
  MAX(ски_про) AS ски_про,
  MAX(ски_код) AS ски_код,
  MAX(рег) AS рег,
  MIN(дата_зае) AS дата_зае,
  MAX(дата_вые) AS дата_вые,
  SUM(сут) AS сут,
  MAX(виза_сер) AS виза_сер,
  MAX(виза_номер) AS виза_номер,
  MAX(виза_вид_код) AS виза_вид_код,
  MAX(виза_дата_с) AS виза_дата_с,
  MAX(виза_дата_по) AS виза_дата_по,
  
  MAX(страх_номер) AS страх_номер,
  MAX(страх_кем_код) AS страх_кем_код,
  MAX(страх_дата_с) AS страх_дата_с,
  MAX(страх_дата_по) AS страх_дата_по,
  MAX(гра_дата) AS гра_дата,
  MAX(гра_код) AS гра_код,
  MAX(миг_карта) AS миг_карта,
  MAX(миг_карта_дата_с) AS миг_карта_дата_с,
  MAX(миг_карта_дата_по) AS миг_карта_дата_по,
  MAX(раб_прибыл) AS раб_прибыл
FROM
  dbo.опер
GROUP  BY
  счет_код,
  кли_код
ORDER  BY
  кли_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[38] 2[18] 3) )"
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
         Configuration = "(H (1[30] 4) )"
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
         Begin Table = "опер"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 406
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 16
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
      Begin ColumnWidths = 12
         Column = 2895
         Alias = 2400
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
', 'SCHEMA', N'dbo', 'VIEW', N'во_кли_счет'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'во_кли_счет'
GO