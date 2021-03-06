SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Event]
Print 'Create Table [dbo].[Event]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event] (
		[EventID]              [uniqueidentifier] NOT NULL,
		[EventType]            [nvarchar](260) NOT NULL,
		[EventData]            [nvarchar](260) NULL,
		[TimeEntered]          [datetime] NOT NULL,
		[ProcessStart]         [datetime] NULL,
		[ProcessHeartbeat]     [datetime] NULL,
		[BatchID]              [uniqueidentifier] NULL,
		CONSTRAINT [PK_Event]
		PRIMARY KEY
		CLUSTERED
		([EventID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Event2]
	ON [dbo].[Event] ([ProcessStart])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Event_TimeEntered]
	ON [dbo].[Event] ([TimeEntered])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event] SET (LOCK_ESCALATION = TABLE)
GO

