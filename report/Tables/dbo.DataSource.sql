SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[DataSource]
Print 'Create Table [dbo].[DataSource]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSource] (
		[DSID]                                     [uniqueidentifier] NOT NULL,
		[ItemID]                                   [uniqueidentifier] NULL,
		[SubscriptionID]                           [uniqueidentifier] NULL,
		[Name]                                     [nvarchar](260) NULL,
		[Extension]                                [nvarchar](260) NULL,
		[Link]                                     [uniqueidentifier] NULL,
		[CredentialRetrieval]                      [int] NULL,
		[Prompt]                                   [ntext] NULL,
		[ConnectionString]                         [image] NULL,
		[OriginalConnectionString]                 [image] NULL,
		[OriginalConnectStringExpressionBased]     [bit] NULL,
		[UserName]                                 [image] NULL,
		[Password]                                 [image] NULL,
		[Flags]                                    [int] NULL,
		[Version]                                  [int] NOT NULL,
		CONSTRAINT [PK_DataSource]
		PRIMARY KEY
		CLUSTERED
		([DSID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceItemID]
	ON [dbo].[DataSource] ([ItemID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceSubscriptionID]
	ON [dbo].[DataSource] ([SubscriptionID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataSource] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[DataSource]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DataSourceItemID]
	FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[DataSource]
	CHECK CONSTRAINT [FK_DataSourceItemID]

GO

