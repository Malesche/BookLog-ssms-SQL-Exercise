USE [BookLog]
GO

ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD  CONSTRAINT [CK_ReadingLog_Percentage] CHECK  (([Percentage]<=(100) AND [Percentage]>=(0)))
GO

ALTER TABLE [dbo].[ReadingLog] CHECK CONSTRAINT [CK_ReadingLog_Percentage]
GO


