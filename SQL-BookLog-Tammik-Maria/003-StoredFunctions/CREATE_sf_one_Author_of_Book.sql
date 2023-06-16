USE BookLog;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE OR ALTER FUNCTION sf_one_Author_of_Book 
(
	-- Add the parameters for the function here
	@BookID int
)
RETURNS nvarchar(255)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Authorname nvarchar(255);

	-- Add the T-SQL statements to compute the return value here
	
	-- Return the result of the function
	RETURN (
	SELECT TOP (1) dbo.Creator.CreatorName
	FROM dbo.Creator 
		INNER JOIN dbo.contributesTo 
			ON dbo.Creator.ID = dbo.contributesTo.CreatorID 
		INNER JOIN dbo.Book 
			ON dbo.contributesTo.BookID = dbo.Book.ID 
		INNER JOIN dbo.contrRoleList 
			ON dbo.contributesTo.RoleID = dbo.contrRoleList.ID
	WHERE dbo.Book.ID = @BookID AND (dbo.contrRoleList.CreatorRole = N'Author')
	);

END
GO

