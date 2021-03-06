
-- Insert scripts for table: Roles
PRINT 'Inserting rows into table: Roles'
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('91d7efe8-1863-4ced-acb9-715762b2c469', N'Browser', N'May view folders, reports and subscribe to reports.', N'0010101001000100', 0)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('c074066b-b5a6-4a70-a378-52359109e432', N'Content Manager', N'May manage content in the Report Server.  This includes folders, reports and resources.', N'1111111111111111', 0)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('e0fbf6de-2767-4f99-a836-abd3ae3e86b8', N'Model Item Browser', N'Allows users to view model items in a particular model.', N'1', 2)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('7dedeeb7-25c0-47fb-8394-38ee3ed733d0', N'My Reports', N'May publish reports and linked reports; manage folders, reports and resources in a users My Reports folder.', N'0111111111011000', 0)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('0427cc27-e531-4e5c-a84d-ffdef273f15e', N'Publisher', N'May publish reports and linked reports to the Report Server.', N'0101010100001010', 0)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('ec97d6d1-8afe-4ee2-9442-c0f507325cf1', N'Report Builder', N'May view report definitions.', N'0010101001000101', 0)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('3e1edee3-494d-4247-9a86-9ce59efde314', N'System Administrator', N'View and modify system role assignments, system role definitions, system properties, and shared schedules.', N'110101011', 1)
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName], [Description], [TaskMask], [RoleFlags]) VALUES ('2da5e539-8309-4423-8f0e-86aa7e49b704', N'System User', N'View system properties, shared schedules, and allow use of Report Builder or other clients that execute report definitions.', N'001010001', 1)
GO


