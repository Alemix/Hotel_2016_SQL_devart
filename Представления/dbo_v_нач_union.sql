SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_нач_union] AS

SELECT дата,
       опер_код,
       11 AS усл_код,
       кол,
       сут,
       цена,
       про_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(про_сум, 0) != 0
       AND мест = 1
UNION ALL
SELECT дата,
       опер_код,
       12 AS усл_код,
       кол,
       сут,
       цена,
       про_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(про_сум, 0) != 0
       AND мест = 2
UNION ALL
SELECT дата,
       опер_код,
       13 AS усл_код,
       кол,
       сут,
       цена,
       про_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(про_сум, 0) != 0
       AND мест = 3
UNION ALL
SELECT дата,
       опер_код,
       17 AS усл_код,
       кол,
       сут,
       цена,
       про_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(про_сум, 0) != 0
       AND мест = 7
UNION ALL
SELECT дата,
       опер_код,
       19 AS усл_код,
       кол,
       0 AS сут,
       0 AS цена,
       дкр_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(дкр_сум, 0) != 0
UNION ALL
SELECT дата,
       опер_код,
       31 AS усл_код,
       кол,
       0 AS сут,
       0 AS цена,
       тел_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(тел_сум, 0) != 0
UNION ALL
SELECT дата,
       опер_код,
       41 AS усл_код,
       кол,
       0 AS сут,
       0 AS цена,
       бар_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(бар_сум, 0) != 0
UNION ALL
SELECT дата,
       опер_код,
       21 AS усл_код,
       кол,
       0 AS сут,
       ски_про AS цена,
       ски_сум * -1 AS сумма
FROM   dbo.нач
WHERE  Isnull(ски_сум, 0) != 0
UNION ALL
SELECT дата,
       опер_код,
       51 AS усл_код,
       кол,
       0 AS сут,
       0 AS цена,
       у_1_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(у_1_сум, 0) != 0
UNION ALL
SELECT дата,
       опер_код,
       52 AS усл_код,
       кол,
       0 AS сут,
       цена AS цена,
       у_2_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(у_2_сум, 0) != 0
UNION ALL
SELECT дата,
       опер_код,
       53 AS усл_код,
       кол,
       0 AS сут,
       цена AS цена,
       у_3_сум AS сумма
FROM   dbo.нач
WHERE  Isnull(у_3_сум, 0) != 0;
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
         Begin Table = "нач"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 184
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 4
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
', 'SCHEMA', N'dbo', 'VIEW', N'v_нач_union'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'v_нач_union'
GO