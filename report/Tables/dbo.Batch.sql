SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Batch]
Print 'Create Table [dbo].[Batch]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Batch] (
		[BatchID]        [uniqueidentifier] NOT NULL,
		[AddedOn]        [datetime] NOT NULL,
		[Action]         [varchar](32) NOT NULL,
		[Item]           [nvarchar](425) NULL,
		[Parent]         [nvarchar](425) NULL,
		[Param]          [nvarchar](425) NULL,
		[BoolParam]      [bit] NULL,
		[Content]        [image] NULL,
		[Properties]     [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_Batch]
	ON [dbo].[Batch] ([BatchID], [AddedOn])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Batch_1]
	ON [dbo].[Batch] ([AddedOn])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch] SET (LOCK_ESCALATION = TABLE)
GO

