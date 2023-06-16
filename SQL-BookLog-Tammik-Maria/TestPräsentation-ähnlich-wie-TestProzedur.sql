USE BookLog;
GO

DECLARE @UserName varchar(255);
SET @UserName = 'fred';
DECLARE @BookID int;
SET @BookID = 11170;  -- 7685 11170 9210

-- Den User anlegen. Auskommentieren um für ihn mehrer Bücher einzutragen
--INSERT INTO [dbo].[User] 
--	VALUES (@UserName);

DECLARE @UserID int;
SET @UserID = [dbo].[sf_UserIDfromName](@UserName);

-- Das Buch für den User auf CurrentlyReading stellen
--INSERT INTO [dbo].[ExclusiveShelf] (UserID, BookID, ShelfID)
--	VALUES (@UserID, @BookID, 8);


-- auf Read verschieben
UPDATE [dbo].[ExclusiveShelf]
	SET ShelfID = 7
	WHERE UserID = @UserID AND BookID = @BookID;


DECLARE	@Erfolg bit;
DECLARE	@Feedback nvarchar(max);
EXEC sp_deleteUserByID
	@UserID,
	@Erfolg OUTPUT,
	@Feedback OUTPUT;
