SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[в_ана_нач_месяц]
AS
WITH значения_по_мес(д_мес_период, д_год_период, опер_код, нач_сум, ски_сум, сут_Период, сут_Всего, кол_взр, кол_дет, кол, койко_суток) AS (SELECT        MONTH(dbo.нач.дата) AS д_мес_период, 
                                                                                                                                                                                                                                                                                                                                                                           YEAR(dbo.нач.дата) AS д_год_период, 
                                                                                                                                                                                                                                                                                                                                                                           dbo.опер.опер_код, SUM(dbo.нач.нач_сум) 
                                                                                                                                                                                                                                                                                                                                                                           AS нач_сум, SUM(dbo.нач.ски_сум) AS ски_сум, 
                                                                                                                                                                                                                                                                                                                                                                           SUM(dbo.нач.сут) AS сут_Период, MAX(dbo.опер.сут) 
                                                                                                                                                                                                                                                                                                                                                                           AS сут_Всего, MAX(dbo.опер.кол_взр) AS кол_взр, 
                                                                                                                                                                                                                                                                                                                                                                           MAX(dbo.опер.кол_дет) AS кол_дет, 
                                                                                                                                                                                                                                                                                                                                                                           MAX(dbo.опер.кол_взр) + MAX(dbo.опер.кол_дет) 
                                                                                                                                                                                                                                                                                                                                                                           AS кол, (MAX(dbo.опер.кол_взр) 
                                                                                                                                                                                                                                                                                                                                                                           + MAX(dbo.опер.кол_дет)) * SUM(dbo.нач.сут) 
                                                                                                                                                                                                                                                                                                                                                                           AS койко_суток
                                                                                                                                                                                                                                                                                                                                                  FROM            dbo.нач INNER JOIN
                                                                                                                                                                                                                                                                                                                                                                           dbo.опер ON 
                                                                                                                                                                                                                                                                                                                                                                           dbo.нач.опер_код = dbo.опер.опер_код
                                                                                                                                                                                                                                                                                                                                                  GROUP BY dbo.опер.опер_код, MONTH(dbo.нач.дата), 
                                                                                                                                                                                                                                                                                                                                                                           YEAR(dbo.нач.дата))
    SELECT        значения_по_мес_1.д_мес_период, значения_по_мес_1.д_год_период, значения_по_мес_1.нач_сум, значения_по_мес_1.ски_сум, опер_1.ски_про, значения_по_мес_1.сут_Период, 
                              значения_по_мес_1.сут_Всего, значения_по_мес_1.кол_взр, значения_по_мес_1.кол_дет, значения_по_мес_1.кол, значения_по_мес_1.койко_суток, dbo.кли.ФИО, dbo.счет.счет_имя, 
                              dbo.счет.тип_код, CASE WHEN ISNULL(dbo.счет.тип_код, 0) = 1 THEN 'Сам' ELSE 'Организация' END AS счет_тип, dbo.орг_хоз.орг_имя AS орг_хоз_имя, dbo.орг.орг_имя, dbo.стр.стр_имя, 
                              CASE WHEN ISNULL(dbo.стр.СНГ, 0) = 1 THEN 'страны СНГ' ELSE 'страны вне СНГ' END AS стр_СНГ, dbo.стр.стр_код, значения_по_мес_1.опер_код
     FROM            dbo.счет LEFT OUTER JOIN
                              dbo.орг_хоз ON dbo.счет.орг_хоз_код = dbo.орг_хоз.орг_код LEFT OUTER JOIN
                              dbo.орг ON dbo.счет.орг_код = dbo.орг.орг_код LEFT OUTER JOIN
                              dbo.опер AS опер_1 ON dbo.счет.счет_код = опер_1.счет_код LEFT OUTER JOIN
                              dbo.кли LEFT OUTER JOIN
                              dbo.стр ON dbo.кли.гражд_код = dbo.стр.стр_код ON опер_1.кли_код = dbo.кли.кли_код RIGHT OUTER JOIN
                              значения_по_мес AS значения_по_мес_1 ON опер_1.опер_код = значения_по_мес_1.опер_код
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
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (1[45] 4) )"
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
         Begin Table = "счет"
            Begin Extent = 
               Top = 17
               Left = 337
               Bottom = 167
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг"
            Begin Extent = 
               Top = 6
               Left = 601
               Bottom = 136
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер_1"
            Begin Extent = 
               Top = 176
               Left = 511
               Bottom = 603
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "кли"
            Begin Extent = 
               Top = 391
               Left = 612
               Bottom = 521
               Right = 804
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "стр"
            Begin Extent = 
               Top = 373
               Left = 156
               Bottom = 503
               Right = 359
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "значения_по_мес_1"
            Begin Extent = 
               Top = 192
               Left = 0
               Bottom = 322
               Right = 174
            End
            DisplayFlags = 280
      ', 'SCHEMA', N'dbo', 'VIEW', N'в_ана_нач_месяц'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'      TopColumn = 0
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
', 'SCHEMA', N'dbo', 'VIEW', N'в_ана_нач_месяц'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'в_ана_нач_месяц'
GO