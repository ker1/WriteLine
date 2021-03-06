SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Keys]
Print 'Create Table [dbo].[Keys]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Keys] (
		[MachineName]        [nvarchar](256) NULL,
		[InstallationID]     [uniqueidentifier] NOT NULL,
		[InstanceName]       [nvarchar](32) NULL,
		[Client]             [int] NOT NULL,
		[PublicKey]          [image] NULL,
		[SymmetricKey]       [image] NULL,
		CONSTRAINT [PK_Keys]
		PRIMARY KEY
		CLUSTERED
		([InstallationID], [Client])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Keys] SET (LOCK_ESCALATION = TABLE)
GO

