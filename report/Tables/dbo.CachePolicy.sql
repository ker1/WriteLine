SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[CachePolicy]
Print 'Create Table [dbo].[CachePolicy]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CachePolicy] (
		[CachePolicyID]       [uniqueidentifier] NOT NULL,
		[ReportID]            [uniqueidentifier] NOT NULL,
		[ExpirationFlags]     [int] NOT NULL,
		[CacheExpiration]     [int] NULL,
		CONSTRAINT [PK_CachePolicy]
		PRIMARY KEY
		NONCLUSTERED
		([CachePolicyID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_CachePolicyReportID]
	ON [dbo].[CachePolicy] ([ReportID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[CachePolicy] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[CachePolicy]
	WITH NOCHECK
	ADD CONSTRAINT [FK_CachePolicyReportID]
	FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[CachePolicy]
	CHECK CONSTRAINT [FK_CachePolicyReportID]

GO

