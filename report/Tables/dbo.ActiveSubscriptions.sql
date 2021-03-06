SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ActiveSubscriptions]
Print 'Create Table [dbo].[ActiveSubscriptions]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ActiveSubscriptions] (
		[ActiveID]               [uniqueidentifier] NOT NULL,
		[SubscriptionID]         [uniqueidentifier] NOT NULL,
		[TotalNotifications]     [int] NULL,
		[TotalSuccesses]         [int] NOT NULL,
		[TotalFailures]          [int] NOT NULL,
		CONSTRAINT [PK_ActiveSubscriptions]
		PRIMARY KEY
		CLUSTERED
		([ActiveID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActiveSubscriptions] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[ActiveSubscriptions]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ActiveSubscriptions_Subscriptions]
	FOREIGN KEY ([SubscriptionID]) REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ActiveSubscriptions]
	CHECK CONSTRAINT [FK_ActiveSubscriptions_Subscriptions]

GO

