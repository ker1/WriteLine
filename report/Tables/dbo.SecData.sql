SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[SecData]
Print 'Create Table [dbo].[SecData]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SecData] (
		[SecDataID]              [uniqueidentifier] NOT NULL,
		[PolicyID]               [uniqueidentifier] NOT NULL,
		[AuthType]               [int] NOT NULL,
		[XmlDescription]         [ntext] NOT NULL,
		[NtSecDescPrimary]       [image] NOT NULL,
		[NtSecDescSecondary]     [ntext] NULL,
		CONSTRAINT [PK_SecData]
		PRIMARY KEY
		NONCLUSTERED
		([SecDataID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_SecData]
	ON [dbo].[SecData] ([PolicyID], [AuthType])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SecData] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[SecData]
	WITH NOCHECK
	ADD CONSTRAINT [FK_SecDataPolicyID]
	FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[SecData]
	CHECK CONSTRAINT [FK_SecDataPolicyID]

GO

