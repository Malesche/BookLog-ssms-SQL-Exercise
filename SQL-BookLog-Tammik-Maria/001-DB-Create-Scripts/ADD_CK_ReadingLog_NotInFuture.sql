USE [BookLog]
GO

ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD  CONSTRAINT [CK_ReadingLog_NotInFuture] CHECK  (([LogDate]<=getdate()))
GO

ALTER TABLE [dbo].[ReadingLog] CHECK CONSTRAINT [CK_ReadingLog_NotInFuture]
GO


