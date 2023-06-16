USE [BookLog]
GO

ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD  CONSTRAINT [FK_ReadingLog_ReadDates] FOREIGN KEY([ReadDatesID])
REFERENCES [dbo].[ReadDates] ([ID])
GO

ALTER TABLE [dbo].[ReadingLog] CHECK CONSTRAINT [FK_ReadingLog_ReadDates]
GO


