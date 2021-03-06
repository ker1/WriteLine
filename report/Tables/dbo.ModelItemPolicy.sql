SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ModelItemPolicy]
Print 'Create Table [dbo].[ModelItemPolicy]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModelItemPolicy] (
		[ID]                [uniqueidentifier] NOT NULL,
		[CatalogItemID]     [uniqueidentifier] NOT NULL,
		[ModelItemID]       [nvarchar](425) NOT NULL,
		[PolicyID]          [uniqueidentifier] NOT NULL,
		CONSTRAINT [PK_ModelItemPolicy]
		PRIMARY KEY
		NONCLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_ModelItemPolicy]
	ON [dbo].[ModelItemPolicy] ([CatalogItemID], [ModelItemID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelItemPolicy] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[ModelItemPolicy]
	WITH NOCHECK
	ADD CONSTRAINT [FK_PoliciesPolicyID]
	FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ModelItemPolicy]
	CHECK CONSTRAINT [FK_PoliciesPolicyID]

GO

