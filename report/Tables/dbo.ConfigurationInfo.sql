SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ConfigurationInfo]
Print 'Create Table [dbo].[ConfigurationInfo]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfigurationInfo] (
		[ConfigInfoID]     [uniqueidentifier] NOT NULL,
		[Name]             [nvarchar](260) NOT NULL,
		[Value]            [ntext] NOT NULL,
		CONSTRAINT [PK_ConfigurationInfo]
		PRIMARY KEY
		NONCLUSTERED
		([ConfigInfoID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ConfigurationInfo]
	ON [dbo].[ConfigurationInfo] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConfigurationInfo] SET (LOCK_ESCALATION = TABLE)
GO

