USE [BookLog]
GO

ALTER TABLE [dbo].[ReadDates]  WITH CHECK ADD  CONSTRAINT [CK_ReadDates_StartNotInFuture] CHECK  (([StartDate]<=getdate()))
GO

ALTER TABLE [dbo].[ReadDates] CHECK CONSTRAINT [CK_ReadDates_StartNotInFuture]
GO


