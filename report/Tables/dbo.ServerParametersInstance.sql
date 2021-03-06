SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ServerParametersInstance]
Print 'Create Table [dbo].[ServerParametersInstance]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerParametersInstance] (
		[ServerParametersID]     [nvarchar](32) NOT NULL,
		[ParentID]               [nvarchar](32) NULL,
		[Path]                   [nvarchar](425) NOT NULL,
		[CreateDate]             [datetime] NOT NULL,
		[ModifiedDate]           [datetime] NOT NULL,
		[Timeout]                [int] NOT NULL,
		[Expiration]             [datetime] NOT NULL,
		[ParametersValues]       [image] NOT NULL,
		CONSTRAINT [PK_ServerParametersInstance]
		PRIMARY KEY
		CLUSTERED
		([ServerParametersID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ServerParametersInstanceExpiration]
	ON [dbo].[ServerParametersInstance] ([Expiration] DESC)
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServerParametersInstance] SET (LOCK_ESCALATION = TABLE)
GO

