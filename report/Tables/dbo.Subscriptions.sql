SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Subscriptions]
Print 'Create Table [dbo].[Subscriptions]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subscriptions] (
		[SubscriptionID]        [uniqueidentifier] NOT NULL,
		[OwnerID]               [uniqueidentifier] NOT NULL,
		[Report_OID]            [uniqueidentifier] NOT NULL,
		[Locale]                [nvarchar](128) NOT NULL,
		[InactiveFlags]         [int] NOT NULL,
		[ExtensionSettings]     [ntext] NULL,
		[ModifiedByID]          [uniqueidentifier] NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		[Description]           [nvarchar](512) NULL,
		[LastStatus]            [nvarchar](260) NULL,
		[EventType]             [nvarchar](260) NOT NULL,
		[MatchData]             [ntext] NULL,
		[LastRunTime]           [datetime] NULL,
		[Parameters]            [ntext] NULL,
		[DataSettings]          [ntext] NULL,
		[DeliveryExtension]     [nvarchar](260) NULL,
		[Version]               [int] NOT NULL,
		[ReportZone]            [int] NOT NULL,
		CONSTRAINT [PK_Subscriptions]
		PRIMARY KEY
		CLUSTERED
		([SubscriptionID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subscriptions]
	ADD
	CONSTRAINT [DF__Subscript__Repor__16644E42]
	DEFAULT ((0)) FOR [ReportZone]
GO
ALTER TABLE [dbo].[Subscriptions] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[Subscriptions]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Subscriptions_Catalog]
	FOREIGN KEY ([Report_OID]) REFERENCES [dbo].[Catalog] ([ItemID])
	ON DELETE CASCADE
	NOT FOR REPLICATION
ALTER TABLE [dbo].[Subscriptions]
	CHECK CONSTRAINT [FK_Subscriptions_Catalog]

GO
ALTER TABLE [dbo].[Subscriptions]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Subscriptions_ModifiedBy]
	FOREIGN KEY ([ModifiedByID]) REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Subscriptions]
	CHECK CONSTRAINT [FK_Subscriptions_ModifiedBy]

GO
ALTER TABLE [dbo].[Subscriptions]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Subscriptions_Owner]
	FOREIGN KEY ([OwnerID]) REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[Subscriptions]
	CHECK CONSTRAINT [FK_Subscriptions_Owner]

GO

