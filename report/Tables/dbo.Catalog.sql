SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Catalog]
Print 'Create Table [dbo].[Catalog]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalog] (
		[ItemID]             [uniqueidentifier] NOT NULL,
		[Path]               [nvarchar](425) NOT NULL,
		[Name]               [nvarchar](425) NOT NULL,
		[ParentID]           [uniqueidentifier] NULL,
		[Type]               [int] NOT NULL,
		[Content]            [image] NULL,
		[Intermediate]       [uniqueidentifier] NULL,
		[SnapshotDataID]     [uniqueidentifier] NULL,
		[LinkSourceID]       [uniqueidentifier] NULL,
		[Property]           [ntext] NULL,
		[Description]        [nvarchar](512) NULL,
		[Hidden]             [bit] NULL,
		[CreatedByID]        [uniqueidentifier] NOT NULL,
		[CreationDate]       [datetime] NOT NULL,
		[ModifiedByID]       [uniqueidentifier] NOT NULL,
		[ModifiedDate]       [datetime] NOT NULL,
		[MimeType]           [nvarchar](260) NULL,
		[SnapshotLimit]      [int] NULL,
		[Parameter]          [ntext] NULL,
		[PolicyID]           [uniqueidentifier] NOT NULL,
		[PolicyRoot]         [bit] NOT NULL,
		[ExecutionFlag]      [int] NOT NULL,
		[ExecutionTime]      [datetime] NULL,
		[SubType]            [nvarchar](128) NULL,
		[ComponentID]        [uniqueidentifier] NULL,
		CONSTRAINT [PK_Catalog]
		PRIMARY KEY
		NONCLUSTERED
		([ItemID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Catalog]
	ON [dbo].[Catalog] ([Path])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Link]
	ON [dbo].[Catalog] ([LinkSourceID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Parent]
	ON [dbo].[Catalog] ([ParentID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataId]
	ON [dbo].[Catalog] ([SnapshotDataID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ComponentLookup]
	ON [dbo].[Catalog] ([Type], [ComponentID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Catalog] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[Catalog]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Catalog_ParentID]
	FOREIGN KEY ([ParentID]) REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[Catalog]
	CHECK CONSTRAINT [FK_Catalog_ParentID]

GO
ALTER TABLE [dbo].[Catalog]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Catalog_LinkSourceID]
	FOREIGN KEY ([LinkSourceID]) REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[Catalog]
	CHECK CONSTRAINT [FK_Catalog_LinkSourceID]

GO
ALTER TABLE [dbo].[Catalog]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Catalog_Policy]
	FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
ALTER TABLE [dbo].[Catalog]
	CHECK CONSTRAINT [FK_Catalog_Policy]

GO
ALTER TABLE [dbo].[Catalog]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Catalog_CreatedByID]
	FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Catalog]
	CHECK CONSTRAINT [FK_Catalog_CreatedByID]

GO
ALTER TABLE [dbo].[Catalog]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Catalog_ModifiedByID]
	FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Catalog]
	CHECK CONSTRAINT [FK_Catalog_ModifiedByID]

GO

