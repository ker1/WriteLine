
-- Insert scripts for table: Users
PRINT 'Inserting rows into table: Users'
INSERT INTO [dbo].[Users] ([UserID], [Sid], [UserType], [AuthType], [UserName]) VALUES ('814cb3d2-64d5-414e-a1d1-fb152d70c795', 0x010100000000000100000000, 1, 1, N'Everyone')
INSERT INTO [dbo].[Users] ([UserID], [Sid], [UserType], [AuthType], [UserName]) VALUES ('1f047ec1-a0db-4809-9d77-4453a144845e', 0x010100000000000512000000, 0, 1, N'NT AUTHORITY\SYSTEM')
INSERT INTO [dbo].[Users] ([UserID], [Sid], [UserType], [AuthType], [UserName]) VALUES ('38560c62-d112-4deb-8c40-ba82ae4f5681', 0x01020000000000052000000020020000, 1, 1, N'BUILTIN\Administrators')
GO


