USE BookLog;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER tr_ExclusiveShelf_UPDATE_intoReadDates
	ON dbo.ExclusiveShelf 
	FOR UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @insertedShelfName nvarchar(255);
	SELECT @insertedShelfName = ExclShelfList.ShelfName 
		FROM  inserted
			INNER JOIN dbo.ExclShelfList
				ON ExclShelfList.ID = inserted.ShelfID;

	-- if exclusiveShelf inserted, @insertedShelfName = currently reading
	-- then insert StartDate into ReadDates
	IF (@insertedShelfName = 'CurrentlyReading')
	BEGIN
		INSERT INTO dbo.ReadDates
				(UserID, BookID, StartDate)
		--SELECT	UserID, BookID, GETDATE()
		SELECT	UserID, BookID, CONVERT(DATE, GETDATE())
		FROM inserted;
	END

	-- if exclusiveShelf inserted = read and deleted = currently reading
	--			(we only want to do this if it was currently reading, 
	--			they might have read it a long time ago)
	-- then insert EndDate into ReadDates
	ELSE IF (@insertedShelfName = 'Read')
	BEGIN
		-- TODO check whether there is already a ReadDate 
		-- without EndDate and UPDATE that one
		DECLARE @insertedUserID int;
		DECLARE @insertedBookID int;
		SELECT @insertedUserID = inserted.UserID FROM inserted;
		SELECT @insertedBookID = inserted.BookID FROM inserted;

		DECLARE @PreviousEndDate date;
		DECLARE @PreviousReadDateID int;
		-- pick latest StartDate from ReadDates
		SELECT	@PreviousEndDate = ReadDates.EndDate, 
				@PreviousReadDateID = ReadDates.ID
			FROM dbo.ReadDates
			WHERE ReadDates.UserID = @insertedUserID
				AND ReadDates.BookID = @insertedBookID
				AND ReadDates.StartDate = 
					(SELECT MAX(StartDate) FROM ReadDates);

		IF @PreviousEndDate IS NULL
		BEGIN
			--PRINT '- in trigger before update prev is null';
			UPDATE dbo.ReadDates
			SET		ReadDates.EndDate = CONVERT(DATE, GetDate())
			WHERE ReadDates.ID = @PreviousReadDateID;
			--PRINT '- in trigger before update prev is null';
		END
		ELSE 
			INSERT INTO dbo.ReadDates
					(UserID, BookID, EndDate)
			SELECT	UserID, BookID, CONVERT(DATE, GETDATE())
			FROM inserted;

	END
END
GO