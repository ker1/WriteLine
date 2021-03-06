SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[DataSets]
Print 'Create Table [dbo].[DataSets]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSets] (
		[ID]         [uniqueidentifier] NOT NULL,
		[ItemID]     [uniqueidentifier] NOT NULL,
		[LinkID]     [uniqueidentifier] NULL,
		[Name]       [nvarchar](260) NOT NULL,
		CONSTRAINT [PK_DataSet]
		PRIMARY KEY
		NONCLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_DataSet_ItemID_Name]
	ON [dbo].[DataSets] ([ItemID], [Name])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSetLinkID]
	ON [dbo].[DataSets] ([LinkID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataSets] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[DataSets]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DataSetItemID]
	FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[DataSets]
	CHECK CONSTRAINT [FK_DataSetItemID]

GO
ALTER TABLE [dbo].[DataSets]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DataSetLinkID]
	FOREIGN KEY ([LinkID]) REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[DataSets]
	CHECK CONSTRAINT [FK_DataSetLinkID]

GO

