SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Users]
Print 'Create Table [dbo].[Users]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users] (
		[UserID]       [uniqueidentifier] NOT NULL,
		[Sid]          [varbinary](85) NULL,
		[UserType]     [int] NOT NULL,
		[AuthType]     [int] NOT NULL,
		[UserName]     [nvarchar](260) NULL,
		CONSTRAINT [PK_Users]
		PRIMARY KEY
		NONCLUSTERED
		([UserID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Users]
	ON [dbo].[Users] ([Sid], [UserName], [AuthType])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = TABLE)
GO

