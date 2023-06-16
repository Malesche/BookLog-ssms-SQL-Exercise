USE BookLog;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Maria Tammik>
-- Description:	<Delete a User and their related enries in the tables
--					ReadDates, ExclusiveShelves and ReadingLog>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[sp_deleteUserByID] 
	-- Add the parameters for the stored procedure here
	@UserID int,

	@Erfolg bit OUTPUT,
	@Feedback varchar(max) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM ReadingLog
		WHERE ReadingLog.ReadDatesID
		IN (SELECT ReadDates.ID
			FROM ReadDates
			WHERE ReadDates.UserID = @UserID);
	DELETE FROM ReadDates
		WHERE ReadDates.UserID = @UserID;
	DELETE FROM ExclusiveShelf
		WHERE ExclusiveShelf.UserID = @UserID;
	DELETE FROM [dbo].[User]
		WHERE ID = @UserID;	

	SET @Erfolg = 1;
	SET @Feedback = 'User ' +  CONVERT(varchar, @UserID) + 
					' and their Entries in ExclusiveShelves, ReadDates and ReadingLog have been deleted.';
END
GO
