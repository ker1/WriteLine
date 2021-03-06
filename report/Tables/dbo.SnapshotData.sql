SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[SnapshotData]
Print 'Create Table [dbo].[SnapshotData]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SnapshotData] (
		[SnapshotDataID]        [uniqueidentifier] NOT NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[ParamsHash]            [int] NULL,
		[QueryParams]           [ntext] NULL,
		[EffectiveParams]       [ntext] NULL,
		[Description]           [nvarchar](512) NULL,
		[DependsOnUser]         [bit] NULL,
		[PermanentRefcount]     [int] NOT NULL,
		[TransientRefcount]     [int] NOT NULL,
		[ExpirationDate]        [datetime] NOT NULL,
		[PageCount]             [int] NULL,
		[HasDocMap]             [bit] NULL,
		[PaginationMode]        [smallint] NULL,
		[ProcessingFlags]       [int] NULL,
		CONSTRAINT [PK_SnapshotData]
		PRIMARY KEY
		CLUSTERED
		([SnapshotDataID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotCleaning]
	ON [dbo].[SnapshotData] ([PermanentRefcount])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SnapshotData] SET (LOCK_ESCALATION = TABLE)
GO

