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
CREATE OR ALTER FUNCTION tf_AuthorsWithSeveralBooks 
(	
	-- Add the parameters for the function here
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT dbo.Creator.CreatorName, dbo.Creator.ID AS 'Creator ID', COUNT(*) AS Expr1
	FROM dbo.Creator 
		INNER JOIN dbo.contributesTo 
			ON dbo.Creator.ID = dbo.contributesTo.CreatorID 
		INNER JOIN dbo.Book 
			ON dbo.contributesTo.BookID = dbo.Book.ID
	GROUP BY dbo.Creator.CreatorName, dbo.Creator.ID
	HAVING        (COUNT(*) > 1)
)
GO
