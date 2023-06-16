USE [BookLog]
GO

/****** Object:  Table [dbo].[ReadingLog]    Script Date: 12.06.2023 14:17:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ReadingLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReadDatesID] [int] NOT NULL,
	[LogDate] [date] NOT NULL,
	[Page] [int] NULL,
	[Percentage] [tinyint] NULL,
	[ReadingNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReadingLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD  CONSTRAINT [FK_ReadingLog_ReadDates] FOREIGN KEY([ReadDatesID])
REFERENCES [dbo].[ReadDates] ([ID])
GO

ALTER TABLE [dbo].[ReadingLog] CHECK CONSTRAINT [FK_ReadingLog_ReadDates]
GO

ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD  CONSTRAINT [CK_ReadingLog_NotInFuture] CHECK  (([LogDate]<=getdate()))
GO

ALTER TABLE [dbo].[ReadingLog] CHECK CONSTRAINT [CK_ReadingLog_NotInFuture]
GO

ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD  CONSTRAINT [CK_ReadingLog_Percentage] CHECK  (([Percentage]<=(100) AND [Percentage]>=(0)))
GO

ALTER TABLE [dbo].[ReadingLog] CHECK CONSTRAINT [CK_ReadingLog_Percentage]
GO


