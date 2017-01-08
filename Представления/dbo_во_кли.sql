SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[во_кли] AS

SELECT
  опер.счет_код,
  опер.опер_код,
  опер.ном_код,
  опер.дата_зае,
  опер.дата_вые,
  опер.сут,
  опер.кли_код,
 -- фам иия отч
  кли.фам,
  кли.имя,
  кли.отч,
  dbo.Фс_фио(опер.кли_код) AS фио,
  dbo.Фс_фам_ио(опер.кли_код) AS фам_ио,
  Rtrim(кли.имя) + ' ' + Rtrim(кли.отч) AS имя_отч,
 -- док 
  dbo.Фс_паспорт(опер.кли_код) AS паспорт,
  dbo.Фс_кли_имя_граж_срок(опер.счет_код, опер.кли_код) AS граж_срок,
 -- адр рожд
  dbo.Фс_адр_имя(опер.кли_код) AS адр_имя,
  Isnull(кли.рожд_дата, '') AS рожд_дата,
  Isnull(опер.раб_прибыл, '') AS раб_прибыл,
 -- суммы 
  v_сум_нач.нач_сум as нач_сум_о,
  v_сум_нач.ски_сум as ски_сум_о 
FROM
  опер
LEFT OUTER JOIN v_сум_нач
  ON опер.опер_код = v_сум_нач.опер_код
LEFT OUTER JOIN кли
  ON опер.кли_код = кли.кли_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[33] 2[13] 3) )"
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
         Begin Table = "опер"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 246
               Right = 370
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "кли"
            Begin Extent = 
               Top = 13
               Left = 454
               Bottom = 282
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 24
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1515
         Width = 1560
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
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'во_кли'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'во_кли'
GO