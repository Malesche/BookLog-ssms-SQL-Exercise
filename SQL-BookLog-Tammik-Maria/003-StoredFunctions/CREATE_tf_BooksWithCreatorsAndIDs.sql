USE BookLog;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER FUNCTION tf_BooksWithCreatorsAndIDs 
(	
	-- Add the parameters for the function here
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.Book.Title, dbo.Book.ID, dbo.Creator.CreatorName, dbo.Creator.ID AS CreatorID
	FROM dbo.Book 
		INNER JOIN dbo.contributesTo 
			ON dbo.Book.ID = dbo.contributesTo.BookID 
		INNER JOIN dbo.Creator 
			ON dbo.contributesTo.CreatorID = dbo.Creator.ID
)
GO
