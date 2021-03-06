SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ServerUpgradeHistory]
Print 'Create Table [dbo].[ServerUpgradeHistory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerUpgradeHistory] (
		[UpgradeID]         [bigint] IDENTITY(1, 1) NOT NULL,
		[ServerVersion]     [nvarchar](25) NULL,
		[User]              [nvarchar](128) NULL,
		[DateTime]          [datetime] NULL,
		CONSTRAINT [PK_ServerUpgradeHistory]
		PRIMARY KEY
		CLUSTERED
		([UpgradeID] DESC)
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory]
	ADD
	CONSTRAINT [DF__ServerUpgr__User__1EF99443]
	DEFAULT (suser_sname()) FOR [User]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory]
	ADD
	CONSTRAINT [DF__ServerUpg__DateT__1FEDB87C]
	DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[ServerUpgradeHistory] SET (LOCK_ESCALATION = TABLE)
GO

