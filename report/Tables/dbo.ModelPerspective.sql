SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ModelPerspective]
Print 'Create Table [dbo].[ModelPerspective]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ModelPerspective] (
		[ID]                         [uniqueidentifier] NOT NULL,
		[ModelID]                    [uniqueidentifier] NOT NULL,
		[PerspectiveID]              [ntext] NOT NULL,
		[PerspectiveName]            [ntext] NULL,
		[PerspectiveDescription]     [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_ModelPerspective]
	ON [dbo].[ModelPerspective] ([ModelID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModelPerspective] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[ModelPerspective]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ModelPerspectiveModel]
	FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Catalog] ([ItemID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ModelPerspective]
	CHECK CONSTRAINT [FK_ModelPerspectiveModel]

GO

