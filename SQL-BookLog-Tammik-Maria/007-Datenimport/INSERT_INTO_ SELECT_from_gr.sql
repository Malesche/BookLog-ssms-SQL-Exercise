INSERT INTO Book (Title, Pagecount, Format, Publisher, PubDate, ISBN, ISBN13, goodreadsID, datasource)
SELECT Title, CAST([Number of Pages] AS int), Binding, Publisher, [Year Published], ISBN, ISBN13, [Book Id], 'own_gr1' 
FROM gr

INSERT INTO Creator (CreatorName, datasource)
SELECT DISTINCT Author, 'own_gr1'
FROM gr

INSERT INTO contributesTo (CreatorID, BookID, RoleID)
SELECT Creator.ID, Book.ID, 1
FROM Creator
	INNER JOIN gr
		ON [Creator].[CreatorName] = gr.Author
	INNER JOIN Book
		ON Book.goodreadsID = gr.[Book Id]


--SELECT Creator.ID, Book.ID, contrRoleList.ID
--FROM Creator
--	INNER JOIN gr
--		ON [Creator].[CreatorName] = gr.Author
--	INNER JOIN Book
--		ON Book.goodreadsID = gr.[Book Id]
--WHERE contrRoleList.CreatorRole = 'Author'




DELETE FROM Book WHERE datasource='own_gr1'
DELETE FROM Creator WHERE datasource='own_gr1'