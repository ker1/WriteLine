SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Roles]
Print 'Create Table [dbo].[Roles]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles] (
		[RoleID]          [uniqueidentifier] NOT NULL,
		[RoleName]        [nvarchar](260) NOT NULL,
		[Description]     [nvarchar](512) NULL,
		[TaskMask]        [nvarchar](32) NOT NULL,
		[RoleFlags]       [tinyint] NOT NULL,
		CONSTRAINT [PK_Roles]
		PRIMARY KEY
		NONCLUSTERED
		([RoleID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Roles]
	ON [dbo].[Roles] ([RoleName])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] SET (LOCK_ESCALATION = TABLE)
GO

