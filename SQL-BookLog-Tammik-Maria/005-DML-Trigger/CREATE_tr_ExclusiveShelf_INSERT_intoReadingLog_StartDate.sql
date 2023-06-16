USE BookLog;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER tr_ExclusiveShelf_INSERT_intoReadDates_StartDate
	ON dbo.ExclusiveShelf 
	FOR INSERT 
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
		SELECT	UserID, BookID, GETDATE()
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
		DECLARE @PreviousEndDate date;
		DECLARE @PreviousReadID int;
		-- TODO need to pick latest StartDate without an EndDate!
		SELECT @PreviousEndDate = ReadDates.EndDate, @PreviousReadID = ReadDates.ID
			FROM dbo.ReadDates
				INNER JOIN inserted
					ON ReadDates.UserID = inserted.UserID
					AND ReadDates.BookID = inserted.BookID

		IF @PreviousEndDate IS NULL
			UPDATE dbo.ReadDates
			SET		ReadDates.EndDate = GetDate()
			WHERE ReadDates.ID = @PreviousReadID;
		ELSE 
			INSERT INTO dbo.ReadDates
					(UserID, BookID, EndDate)
			SELECT	UserID, BookID, GETDATE()
			FROM inserted;

	END
END
GO


