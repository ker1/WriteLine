SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[History]
Print 'Create Table [dbo].[History]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[History] (
		[HistoryID]          [uniqueidentifier] NOT NULL,
		[ReportID]           [uniqueidentifier] NOT NULL,
		[SnapshotDataID]     [uniqueidentifier] NOT NULL,
		[SnapshotDate]       [datetime] NOT NULL,
		CONSTRAINT [PK_History]
		PRIMARY KEY
		NONCLUSTERED
		([HistoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_History]
	ON [dbo].[History] ([ReportID], [SnapshotDate])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataID]
	ON [dbo].[History] ([SnapshotDataID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[History] SET (LOCK_ESCALATION = TABLE)
GO

