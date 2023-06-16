USE BookLog;
GO

DECLARE	@Erfolg bit; 
DECLARE	@Feedback VARCHAR(MAX);

DECLARE @UserName varchar(255);
SET @UserName = 'fiili';

-- 7685 11170 9210

-- User anlegen
INSERT INTO [dbo].[User] 
	VALUES (@UserName);
DECLARE @UserID int;
SET @UserID = [dbo].[sf_UserIDfromName](@UserName);

-- ein Buch für den User auf CurrentlyReading stellen
INSERT INTO [dbo].[ExclusiveShelf] (UserID, BookID, ShelfID)
	VALUES (@UserID, 11170, 8);

-- Das Buch auf Read verschieben
UPDATE [dbo].[ExclusiveShelf]
	SET ShelfID = 7
	WHERE UserID = @UserID AND BookID = 11170;

EXEC sp_deleteUserByID
	@UserID,
	@Erfolg OUTPUT,
	@Feedback OUTPUT;

---- Gibt keine Information, war nur zum Ausprobieren, kommt auch wenn der User nicht existiert
-- SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';



------------------------------




------------------------------
---- einzelnen Nutzer löschen
------------------------------
--DECLARE	@Erfolg bit; 
--DECLARE	@Feedback VARCHAR(MAX);
-- EXEC sp_deleteUserByID
--	39,
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;