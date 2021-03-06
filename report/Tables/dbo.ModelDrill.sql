SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ModelDrill]
Print 'Create Table [dbo].[ModelDrill]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModelDrill] (
		[ModelDrillID]     [uniqueidentifier] NOT NULL,
		[ModelID]          [uniqueidentifier] NOT NULL,
		[ReportID]         [uniqueidentifier] NOT NULL,
		[ModelItemID]      [nvarchar](425) NOT NULL,
		[Type]             [tinyint] NOT NULL,
		CONSTRAINT [PK_ModelDrill]
		PRIMARY KEY
		NONCLUSTERED
		([ModelDrillID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ModelDrillModelID]
	ON [dbo].[ModelDrill] ([ModelID], [ReportID], [ModelDrillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelDrill] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[ModelDrill]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ModelDrillModel]
	FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Catalog] ([ItemID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ModelDrill]
	CHECK CONSTRAINT [FK_ModelDrillModel]

GO
ALTER TABLE [dbo].[ModelDrill]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ModelDrillReport]
	FOREIGN KEY ([ReportID]) REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[ModelDrill]
	CHECK CONSTRAINT [FK_ModelDrillReport]

GO

