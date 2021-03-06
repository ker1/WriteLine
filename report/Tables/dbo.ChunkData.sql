SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ChunkData]
Print 'Create Table [dbo].[ChunkData]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChunkData] (
		[ChunkID]            [uniqueidentifier] NOT NULL,
		[SnapshotDataID]     [uniqueidentifier] NOT NULL,
		[ChunkFlags]         [tinyint] NULL,
		[ChunkName]          [nvarchar](260) NULL,
		[ChunkType]          [int] NULL,
		[Version]            [smallint] NULL,
		[MimeType]           [nvarchar](260) NULL,
		[Content]            [image] NULL,
		CONSTRAINT [PK_ChunkData]
		PRIMARY KEY
		NONCLUSTERED
		([ChunkID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ChunkData]
	ON [dbo].[ChunkData] ([SnapshotDataID], [ChunkType], [ChunkName])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChunkData] SET (LOCK_ESCALATION = TABLE)
GO

