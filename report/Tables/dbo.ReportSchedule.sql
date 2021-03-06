SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ReportSchedule]
Print 'Create Table [dbo].[ReportSchedule]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ReportSchedule] (
		[ScheduleID]         [uniqueidentifier] NOT NULL,
		[ReportID]           [uniqueidentifier] NOT NULL,
		[SubscriptionID]     [uniqueidentifier] NULL,
		[ReportAction]       [int] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ReportID]
	ON [dbo].[ReportSchedule] ([ReportID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_ScheduleID]
	ON [dbo].[ReportSchedule] ([ScheduleID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReportSchedule_SubscriptionID]
	ON [dbo].[ReportSchedule] ([SubscriptionID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportSchedule] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[ReportSchedule]
	WITH CHECK
	ADD CONSTRAINT [FK_ReportSchedule_Report]
	FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ReportSchedule]
	CHECK CONSTRAINT [FK_ReportSchedule_Report]

GO
ALTER TABLE [dbo].[ReportSchedule]
	WITH CHECK
	ADD CONSTRAINT [FK_ReportSchedule_Schedule]
	FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ReportSchedule]
	CHECK CONSTRAINT [FK_ReportSchedule_Schedule]

GO
ALTER TABLE [dbo].[ReportSchedule]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ReportSchedule_Subscriptions]
	FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[ReportSchedule]
	NOCHECK CONSTRAINT [FK_ReportSchedule_Subscriptions]

GO

