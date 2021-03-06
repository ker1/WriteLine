SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Schedule]
Print 'Create Table [dbo].[Schedule]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule] (
		[ScheduleID]              [uniqueidentifier] NOT NULL,
		[Name]                    [nvarchar](260) NOT NULL,
		[StartDate]               [datetime] NOT NULL,
		[Flags]                   [int] NOT NULL,
		[NextRunTime]             [datetime] NULL,
		[LastRunTime]             [datetime] NULL,
		[EndDate]                 [datetime] NULL,
		[RecurrenceType]          [int] NULL,
		[MinutesInterval]         [int] NULL,
		[DaysInterval]            [int] NULL,
		[WeeksInterval]           [int] NULL,
		[DaysOfWeek]              [int] NULL,
		[DaysOfMonth]             [int] NULL,
		[Month]                   [int] NULL,
		[MonthlyWeek]             [int] NULL,
		[State]                   [int] NULL,
		[LastRunStatus]           [nvarchar](260) NULL,
		[ScheduledRunTimeout]     [int] NULL,
		[CreatedById]             [uniqueidentifier] NOT NULL,
		[EventType]               [nvarchar](260) NOT NULL,
		[EventData]               [nvarchar](260) NULL,
		[Type]                    [int] NOT NULL,
		[ConsistancyCheck]        [datetime] NULL,
		[Path]                    [nvarchar](260) NULL,
		CONSTRAINT [IX_Schedule]
		UNIQUE
		NONCLUSTERED
		([Name], [Path])
		ON [PRIMARY],
		CONSTRAINT [PK_ScheduleID]
		PRIMARY KEY
		CLUSTERED
		([ScheduleID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Schedule] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[Schedule]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Schedule_Users]
	FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Schedule]
	CHECK CONSTRAINT [FK_Schedule_Users]

GO

