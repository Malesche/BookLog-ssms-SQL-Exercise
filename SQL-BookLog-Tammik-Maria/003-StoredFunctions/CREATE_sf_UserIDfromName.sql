USE BookLog;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION sf_UserIDfromName 
(
	@UserName nvarchar(255)
)
RETURNS int
AS
BEGIN
	-- Return the result of the function
	RETURN 
		(SELECT [User].ID
		FROM [dbo].[User]
		WHERE [User].UserName = @UserName);

END
GO

