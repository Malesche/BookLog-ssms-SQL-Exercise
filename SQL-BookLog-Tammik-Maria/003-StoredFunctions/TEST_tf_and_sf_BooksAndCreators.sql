USE BookLog
GO

--SELECT Title AS [Bücher mit Tove Janson]
--FROM dbo.tf_BooksByAuthor(10215); -- 10215 Tove Janson

SELECT *
FROM dbo.tf_BooksAndIDByAuthor(10215); -- 10215 Tove Janson


SELECT *
FROM [dbo].[tf_BooksWithCreatorsAndIDs]();

SELECT *
FROM [dbo].[tf_AuthorsWithSeveralBooks]();

SELECT AllBA.CreatorName, AllBA.CreatorID, SeveralBookAuthors.Expr1 AS NumberOfBooks, AllBA.Title, AllBA.ID AS BookID
FROM [dbo].[tf_AuthorsWithSeveralBooks]() AS SeveralBookAuthors
	INNER JOIN [dbo].[tf_BooksWithCreatorsAndIDs]() AS AllBA
		ON SeveralBookAuthors.[Creator ID] = allBA.[CreatorID]
ORDER BY NumberOfBooks DESC;

DECLARE @BookID varchar(255);
SET @BookID = 7711;
SELECT dbo.Creator.CreatorName
	FROM dbo.Creator 
		INNER JOIN dbo.contributesTo 
			ON dbo.Creator.ID = dbo.contributesTo.CreatorID 
		INNER JOIN dbo.Book 
			ON dbo.contributesTo.BookID = dbo.Book.ID 
		INNER JOIN dbo.contrRoleList 
			ON dbo.contributesTo.RoleID = dbo.contrRoleList.ID
	WHERE dbo.Book.ID = 7711 AND (dbo.contrRoleList.CreatorRole = N'Author')



SELECT	dbo.Creator.CreatorName, 
		(SELECT min(Title)
			FROM Book 
			WHERE [dbo].[sf_one_Author_of_Book](Book.ID) = Creator.CreatorName)
FROM dbo.Creator 
	INNER JOIN dbo.contributesTo 
		ON dbo.Creator.ID = dbo.contributesTo.CreatorID 
	INNER JOIN dbo.Book 
		ON dbo.contributesTo.BookID = dbo.Book.ID
GROUP BY dbo.Creator.CreatorName, dbo.Creator.ID
HAVING (COUNT(*) > 1)
ORDER BY COUNT(*) DESC;


SELECT dbo.Creator.CreatorName, dbo.Creator.ID AS 'Creator ID', COUNT(*) AS Expr1
FROM dbo.Creator 
	INNER JOIN dbo.contributesTo 
		ON dbo.Creator.ID = dbo.contributesTo.CreatorID 
	INNER JOIN dbo.Book 
		ON dbo.contributesTo.BookID = dbo.Book.ID
GROUP BY dbo.Creator.CreatorName, dbo.Creator.ID
HAVING        (COUNT(*) > 1)
ORDER BY Expr1 DESC;

