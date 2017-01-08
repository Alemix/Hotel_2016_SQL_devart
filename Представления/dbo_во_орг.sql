SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[во_орг] AS

SELECT
  орг_код AS зак_код,
  орг_имя AS зак_имя,
  dbo.Фс_орг_имя_пол(орг_код) AS зак_имя_пол,
  dbo.Фс_орг_имя_кор(орг_код) AS зак_имя_кор,
  dbo.Фс_преамбула_орг(орг_код) AS зак_преамбула,
  dbo.Фс_орг_дейст_на_осн(орг_код) AS зак_дейст_на_осн,
  dbo.Фс_орг_рук_должность(орг_код) AS зак_рук_должность,
  dbo.Фс_орг_рук_фио_пол(орг_код) AS зак_рук_фио_пол,
  dbo.Фс_орг_рук_фио_кор(орг_код) AS зак_рук_фио_кор,
  счет_номер AS зак_счет_номер,
  счет_мфо AS зак_счет_мфо,
  счет_банк AS зак_счет_банк,
  унп AS зак_унп,
  Rtrim(Isnull(город, '')) AS зак_город,
  Rtrim(Isnull(адрес, '')) AS зак_адрес,
  тел_рук AS зак_тел_рук,
  контакт_фио AS зак_контакт_фио,
  тел_контакт AS зак_тел_контакт,
  тел_факс AS зак_тел_факс
FROM
  dbo.орг
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[51] 2[20] 3) )"
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
         Left = -595
      End
      Begin Tables = 
         Begin Table = "орг"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 290
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 2
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
         Column = 3090
         Alias = 3060
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
', 'SCHEMA', N'dbo', 'VIEW', N'во_орг'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'во_орг'
GO