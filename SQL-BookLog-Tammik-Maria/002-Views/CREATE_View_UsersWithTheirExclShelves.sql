USE [BookLog]
GO

/****** Object:  View [dbo].[View_UsersWithTheirExclShelves]    Script Date: 14.06.2023 12:49:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_UsersWithTheirExclShelves]
AS
SELECT        TOP (100) PERCENT dbo.[User].UserName, dbo.ExclShelfList.ShelfName, dbo.ExclShelfList.ID AS ShelfID, dbo.Book.Title, dbo.Creator.CreatorName
FROM            dbo.ExclusiveShelf INNER JOIN
                         dbo.[User] ON dbo.ExclusiveShelf.UserID = dbo.[User].ID INNER JOIN
                         dbo.contributesTo INNER JOIN
                         dbo.Book ON dbo.contributesTo.BookID = dbo.Book.ID INNER JOIN
                         dbo.Creator ON dbo.contributesTo.CreatorID = dbo.Creator.ID ON dbo.ExclusiveShelf.BookID = dbo.Book.ID INNER JOIN
                         dbo.ExclShelfList ON dbo.ExclusiveShelf.ShelfID = dbo.ExclShelfList.ID
ORDER BY dbo.[User].UserName, dbo.ExclShelfList.ShelfName, dbo.Creator.CreatorName
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
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
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Book"
            Begin Extent = 
               Top = 3
               Left = 328
               Bottom = 186
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "contributesTo"
            Begin Extent = 
               Top = 57
               Left = 574
               Bottom = 187
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Creator"
            Begin Extent = 
               Top = 18
               Left = 764
               Bottom = 131
               Right = 931
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExclusiveShelf"
            Begin Extent = 
               Top = 160
               Left = 108
               Bottom = 290
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExclShelfList"
            Begin Extent = 
               Top = 201
               Left = 340
               Bottom = 314
               Right = 507
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UsersWithTheirExclShelves'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1500
         Width = 1500
         Width = 3975
         Width = 2670
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UsersWithTheirExclShelves'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UsersWithTheirExclShelves'
GO


