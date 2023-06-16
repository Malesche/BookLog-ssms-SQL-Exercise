SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER FUNCTION tf_BooksByCreator 
(	
	-- Add the parameters for the function here
	@AuthorID int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	--DECLARE @AuthorID int;
	--SET @AuthorID = 10215;
	SELECT        dbo.Book.Title
	FROM            dbo.Creator INNER JOIN
                         dbo.contributesTo ON dbo.Creator.ID = dbo.contributesTo.CreatorID INNER JOIN
                         dbo.Book ON dbo.contributesTo.BookID = dbo.Book.ID --INNER JOIN
    --                     dbo.contrRoleList ON dbo.contributesTo.RoleID = dbo.contrRoleList.ID
	WHERE	dbo.Creator.ID = @AuthorID        
)
GO