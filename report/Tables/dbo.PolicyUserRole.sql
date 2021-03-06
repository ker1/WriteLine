SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[PolicyUserRole]
Print 'Create Table [dbo].[PolicyUserRole]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PolicyUserRole] (
		[ID]           [uniqueidentifier] NOT NULL,
		[RoleID]       [uniqueidentifier] NOT NULL,
		[UserID]       [uniqueidentifier] NOT NULL,
		[PolicyID]     [uniqueidentifier] NOT NULL,
		CONSTRAINT [PK_PolicyUserRole]
		PRIMARY KEY
		NONCLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_PolicyUserRole]
	ON [dbo].[PolicyUserRole] ([RoleID], [UserID], [PolicyID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[PolicyUserRole] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[PolicyUserRole]
	WITH NOCHECK
	ADD CONSTRAINT [FK_PolicyUserRole_User]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
ALTER TABLE [dbo].[PolicyUserRole]
	CHECK CONSTRAINT [FK_PolicyUserRole_User]

GO
ALTER TABLE [dbo].[PolicyUserRole]
	WITH NOCHECK
	ADD CONSTRAINT [FK_PolicyUserRole_Role]
	FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
ALTER TABLE [dbo].[PolicyUserRole]
	CHECK CONSTRAINT [FK_PolicyUserRole_Role]

GO
ALTER TABLE [dbo].[PolicyUserRole]
	WITH NOCHECK
	ADD CONSTRAINT [FK_PolicyUserRole_Policy]
	FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[PolicyUserRole]
	CHECK CONSTRAINT [FK_PolicyUserRole_Policy]

GO

