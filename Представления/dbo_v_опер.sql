SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_опер] AS

SELECT
  dbo.опер.опер_код,
  dbo.опер.дата_зае,
  MONTH(dbo.опер.дата_зае) AS дата_зае_мес,
  YEAR(dbo.опер.дата_зае) AS дата_зае_год,
  CONVERT(DATE, dbo.опер.дата_зае) AS дата_зае_дата,
  case 
  when гражд_код = 1 then 'Бел.'
  else 'Ино.' end as гражд,
  dbo.опер.ном_код,
  dbo.ном.НОМ,
  dbo.опер.кли_код,
  dbo.опер.счет_код,
  dbo.опер.дата_вые,
  dbo.кли.фам,
  dbo.кли.имя,
  dbo.кли.отч,
  dbo.кли.ФИО,
  dbo.Фс_опер_имя(dbo.опер.опер_код) AS опер_имя,
  dbo.опер.сут,
  dbo.опер.сут_дни,
  dbo.опер.сут_пол,
  dbo.опер.пол_сут_зае,
  dbo.опер.пол_сут_вые,
  dbo.опер.рег,
  isnull(dbo.опер.рег_пров,0) as рег_пров,
   isnull((dbo.опер.рег - dbo.опер.рег_пров),0)   AS рег_разн,
  dbo.опер.кол_взр,
  dbo.опер.кол_дет,
  dbo.кли.рожд_дата,
  dbo.опер_цель.цель_имя,
  dbo.кли_пол.пол_имя,
  dbo.кли.адрес,
  dbo.кли.гражд_код,
  dbo.стр.стр_имя,
  dbo.кли.телефон,
  dbo.кли.е_маил,
  dbo.опер.раб_должность,
  dbo.опер.раб_место,
  dbo.опер.раб_ком_уд,
  dbo.опер.раб_прибыл,
  dbo.кли_пас_вид.пас_вид_имя,
  dbo.кли.пас_номер,
  dbo.кли.пас_дата,
  dbo.кли.пас_выдан,
  dbo.кли_виза_вид.виза_вид_имя,
  dbo.опер.виза_номер,
  dbo.опер.виза_сер,
  dbo.опер.виза_дата_с,
  dbo.опер.виза_дата_по,
  dbo.кли_страх_кем.страх_кем_имя,
  dbo.опер.страх_номер,
  dbo.опер.страх_дата_с,
  dbo.опер.страх_дата_по,
  dbo.опер.миг_карта,
  dbo.опер.миг_карта_дата_с,
  dbo.опер.миг_карта_дата_по,
  dbo.опер.гра_дата,
  dbo.гра.гра_имя,
  dbo.кли.авто_марка,
  dbo.кли.авто_номер,
  dbo.кли.инф_кли,
  dbo.опер.инф_зае,
  dbo.опер.инф_вые,
  dbo.кли.скид_карта,
  dbo.кли.скид_проц,
  dbo.опер.дата_вые_факт,
  dbo.счет.счет_имя,
  dbo.счет.док,
  dbo.счет.дата,
  dbo.орг.орг_имя,
  dbo.ски.ски_имя,
  dbo.опер.ски_про,
  dbo.опер.дата_соз,
  dbo.опер.дата_изм,
  dbo.опер.дз_МЕС,
  dbo.опер.дз_ГОД,
  dbo.опер.кли_код_был,
  dbo.кли.пол
FROM
  dbo.опер_цель
RIGHT OUTER JOIN dbo.орг_хоз
                 RIGHT OUTER JOIN dbo.орг
                                  RIGHT OUTER JOIN dbo.кли_страх_кем
                                                   RIGHT OUTER JOIN dbo.счет
                                                                    INNER JOIN dbo.опер
                                                                      ON dbo.счет.счет_код = dbo.опер.счет_код
                                                     ON dbo.кли_страх_кем.страх_кем_код = dbo.опер.страх_кем_код
                                                   LEFT OUTER JOIN dbo.гра
                                                     ON dbo.опер.гра_код = dbo.гра.гра_код
                                                   LEFT OUTER JOIN dbo.ски
                                                     ON dbo.опер.ски_код = dbo.ски.ски_код
                                    ON dbo.орг.орг_код = dbo.счет.орг_код
                                  LEFT OUTER JOIN dbo.кли_виза_вид
                                    ON dbo.опер.виза_вид_код = dbo.кли_виза_вид.виза_вид_код
                   ON dbo.орг_хоз.орг_код = dbo.счет.орг_хоз_код
  ON dbo.опер_цель.цель_код = dbo.опер.цель_код
LEFT OUTER JOIN  dbo.кли_пол
                 RIGHT OUTER JOIN dbo.кли_пас_вид
                                  RIGHT OUTER JOIN dbo.кли
                                                   LEFT OUTER JOIN dbo.стр
                                                     ON dbo.кли.адр_страна_код = dbo.стр.стр_код
                                    ON dbo.кли_пас_вид.пас_вид_код = dbo.кли.пас_вид_код
                   ON dbo.кли_пол.пол_код = dbo.кли.пол
  ON dbo.опер.кли_код = dbo.кли.кли_код
LEFT OUTER JOIN  dbo.ном
  ON dbo.опер.ном_код = dbo.ном.ном_код
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[6] 4[57] 2[20] 3) )"
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
         Configuration = "(H (1[48] 4) )"
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
         Configuration = "(V (4) )"
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
         Begin Table = "опер_цель"
            Begin Extent = 
               Top = 176
               Left = 326
               Bottom = 261
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг_хоз"
            Begin Extent = 
               Top = 335
               Left = 925
               Bottom = 450
               Right = 1086
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "орг"
            Begin Extent = 
               Top = 467
               Left = 812
               Bottom = 641
               Right = 973
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_страх_кем"
            Begin Extent = 
               Top = 823
               Left = 274
               Bottom = 923
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "счет"
            Begin Extent = 
               Top = 327
               Left = 576
               Bottom = 493
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "опер"
            Begin Extent = 
               Top = 6
               Left = 21
               Bottom = 741
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "гра"
            Begin Extent = 
               Top = 592
               Left = 379
               Bottom = 677
               Right = 531
            End
            DisplayFlags = 280
 ', 'SCHEMA', N'dbo', 'VIEW', N'v_опер'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'           TopColumn = 0
         End
         Begin Table = "ски"
            Begin Extent = 
               Top = 329
               Left = 313
               Bottom = 414
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_виза_вид"
            Begin Extent = 
               Top = 451
               Left = 252
               Bottom = 536
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_пол"
            Begin Extent = 
               Top = 5
               Left = 858
               Bottom = 90
               Right = 1010
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли_пас_вид"
            Begin Extent = 
               Top = 226
               Left = 873
               Bottom = 311
               Right = 1025
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "кли"
            Begin Extent = 
               Top = 0
               Left = 562
               Bottom = 306
               Right = 732
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "стр"
            Begin Extent = 
               Top = 94
               Left = 849
               Bottom = 209
               Right = 1010
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ном"
            Begin Extent = 
               Top = 2
               Left = 310
               Bottom = 117
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Column = 4170
         Alias = 1770
         Table = 3030
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
', 'SCHEMA', N'dbo', 'VIEW', N'v_опер'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'v_опер'
GO