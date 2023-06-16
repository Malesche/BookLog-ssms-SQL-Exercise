USE BookLog;
GO

DECLARE @UserName varchar(255);
SET @UserName = 'Neue';
DECLARE @BookID int;
SET @BookID = 7685;  -- 7685 11170 9210

-- Den User anlegen. Auskommentieren um für ihn mehrer Bücher einzutragen
INSERT INTO [dbo].[User] 
	VALUES (@UserName);

DECLARE @UserID int;
SET @UserID = [dbo].[sf_UserIDfromName](@UserName);

--Print '---before Inster into shelf cr';
-- Das Buch für den User auf CurrentlyReading stellen
INSERT INTO [dbo].[ExclusiveShelf] (UserID, BookID, ShelfID)
	VALUES (@UserID, @BookID, 8);

--Print '---after Inster into shelf cr';

Print '---before update into shelf read';
-- auf Read verschieben
UPDATE [dbo].[ExclusiveShelf]
	SET ShelfID = 7
	WHERE UserID = @UserID AND BookID = @BookID;
Print '---after  update into shelf read';


