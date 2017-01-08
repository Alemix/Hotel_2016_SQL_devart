SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO



CREATE VIEW [dbo].[в_ана_нач]
AS
SELECT нач.дата
	, YEAR(нач.дата) AS д_год
	, MONTH(нач.дата) AS д_мес
	--, CASE 
	--	WHEN isnull(dbo.нач.кол, 0) = 0
	--		THEN 1
	--	ELSE (dbo.нач.кол )
	--	END AS кол
	, нач.сут
	--, CASE 
	--	WHEN isnull(dbo.нач.кол, 0) = 0
	--		THEN 1
	--	ELSE dbo.нач.кол
	--	END * нач.сут AS койко_суток
	, нач.нач_сум
	, нач.ски_сум
	, CASE 
		WHEN isnull(нач_сум, 0) <> 0
			THEN isnull(нач_сум, 0) / 1000
		ELSE 0
		END AS нач_сум_1000
	, кли.ФИО
	, орг_хоз.орг_имя AS орг_хоз_имя
	, орг.орг_имя
	, счет.счет_имя
	, стр.стр_код
	, стр.стр_имя
	, case when isnull(стр.СНГ,0)=0 then 'вне СНГ' else 'СНГ' end  AS стр_СНГ
	, опер.ном_код
	, опер.кли_код
	, опер.счет_код
	, опер.опер_код
	, счет.орг_хоз_код
	, стр.стр_имя_пол
	, стр.Стр_Код_Стат_4_тур
	, стр.Стр_Код_Стат_12_вэс
FROM стр
RIGHT JOIN нач
INNER JOIN опер
	ON нач.опер_код = опер.опер_код
INNER JOIN кли
	ON опер.кли_код = кли.кли_код
		ON стр.стр_код = кли.адр_страна_код LEFT JOIN орг
RIGHT JOIN счет
	ON орг.орг_код = счет.орг_код
LEFT JOIN орг_хоз
	ON счет.орг_хоз_код = орг_хоз.орг_код
		ON опер.счет_код = счет.счет_код


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
         Configuration = "(H (1[38] 4) )"
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
         Left = -246
      End
      Begin Tables = 
         Begin Table = "нач"
            Begin Extent = 
               Top = 11
               Left = 23
               Bottom = 285
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер"
            Begin Extent = 
               Top = 0
               Left = 362
               Bottom = 328
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "счет"
            Begin Extent = 
               Top = 37
               Left = 690
               Bottom = 381
               Right = 864
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли"
            Begin Extent = 
               Top = 349
               Left = 54
               Bottom = 818
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг"
            Begin Extent = 
               Top = 636
               Left = 805
               Bottom = 832
               Right = 979
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 526
               Left = 500
               Bottom = 656
               Right = 695
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "стр"
            Begin Extent = 
               Top = 336
               Left = 333
               Bottom = 597
               Right = 507
            End
            DisplayFlags = 280
            TopCo', 'SCHEMA', N'dbo', 'VIEW', N'в_ана_нач'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'lumn = 0
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
         Column = 2580
         Alias = 2535
         Table = 2790
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
', 'SCHEMA', N'dbo', 'VIEW', N'в_ана_нач'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'в_ана_нач'
GO