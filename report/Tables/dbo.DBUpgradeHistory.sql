SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[DBUpgradeHistory]
Print 'Create Table [dbo].[DBUpgradeHistory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBUpgradeHistory] (
		[UpgradeID]     [bigint] IDENTITY(1, 1) NOT NULL,
		[DbVersion]     [nvarchar](25) NULL,
		[User]          [nvarchar](128) NULL,
		[DateTime]      [datetime] NULL,
		CONSTRAINT [PK_DBUpgradeHistory]
		PRIMARY KEY
		CLUSTERED
		([UpgradeID] DESC)
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DBUpgradeHistory]
	ADD
	CONSTRAINT [DF__DBUpgradeH__User__1387E197]
	DEFAULT (suser_sname()) FOR [User]
GO
ALTER TABLE [dbo].[DBUpgradeHistory]
	ADD
	CONSTRAINT [DF__DBUpgrade__DateT__147C05D0]
	DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[DBUpgradeHistory] SET (LOCK_ESCALATION = TABLE)
GO

