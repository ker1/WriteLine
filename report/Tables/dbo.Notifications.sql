SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Notifications]
Print 'Create Table [dbo].[Notifications]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notifications] (
		[NotificationID]              [uniqueidentifier] NOT NULL,
		[SubscriptionID]              [uniqueidentifier] NOT NULL,
		[ActivationID]                [uniqueidentifier] NULL,
		[ReportID]                    [uniqueidentifier] NOT NULL,
		[SnapShotDate]                [datetime] NULL,
		[ExtensionSettings]           [ntext] NOT NULL,
		[Locale]                      [nvarchar](128) NOT NULL,
		[Parameters]                  [ntext] NULL,
		[ProcessStart]                [datetime] NULL,
		[NotificationEntered]         [datetime] NOT NULL,
		[ProcessAfter]                [datetime] NULL,
		[Attempt]                     [int] NULL,
		[SubscriptionLastRunTime]     [datetime] NOT NULL,
		[DeliveryExtension]           [nvarchar](260) NOT NULL,
		[SubscriptionOwnerID]         [uniqueidentifier] NOT NULL,
		[IsDataDriven]                [bit] NOT NULL,
		[BatchID]                     [uniqueidentifier] NULL,
		[ProcessHeartbeat]            [datetime] NULL,
		[Version]                     [int] NOT NULL,
		[ReportZone]                  [int] NOT NULL,
		CONSTRAINT [PK_Notifications]
		PRIMARY KEY
		CLUSTERED
		([NotificationID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications]
	ADD
	CONSTRAINT [DF__Notificat__Repor__1758727B]
	DEFAULT ((0)) FOR [ReportZone]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications]
	ON [dbo].[Notifications] ([ProcessAfter])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications2]
	ON [dbo].[Notifications] ([ProcessStart])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Notifications3]
	ON [dbo].[Notifications] ([NotificationEntered])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[Notifications]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Notifications_Subscriptions]
	FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[Notifications]
	CHECK CONSTRAINT [FK_Notifications_Subscriptions]

GO

