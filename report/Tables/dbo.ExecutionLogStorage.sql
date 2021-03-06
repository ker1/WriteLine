SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ExecutionLogStorage]
Print 'Create Table [dbo].[ExecutionLogStorage]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExecutionLogStorage] (
		[LogEntryId]            [bigint] IDENTITY(1, 1) NOT NULL,
		[InstanceName]          [nvarchar](38) NOT NULL,
		[ReportID]              [uniqueidentifier] NULL,
		[UserName]              [nvarchar](260) NULL,
		[ExecutionId]           [nvarchar](64) NULL,
		[RequestType]           [tinyint] NOT NULL,
		[Format]                [nvarchar](26) NULL,
		[Parameters]            [ntext] NULL,
		[ReportAction]          [tinyint] NULL,
		[TimeStart]             [datetime] NOT NULL,
		[TimeEnd]               [datetime] NOT NULL,
		[TimeDataRetrieval]     [int] NOT NULL,
		[TimeProcessing]        [int] NOT NULL,
		[TimeRendering]         [int] NOT NULL,
		[Source]                [tinyint] NOT NULL,
		[Status]                [nvarchar](40) NOT NULL,
		[ByteCount]             [bigint] NOT NULL,
		[RowCount]              [bigint] NOT NULL,
		[AdditionalInfo]        [xml] NULL,
		CONSTRAINT [PK__Executio__05F5D74521F32D79]
		PRIMARY KEY
		CLUSTERED
		([LogEntryId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ExecutionLog]
	ON [dbo].[ExecutionLogStorage] ([TimeStart], [LogEntryId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExecutionLogStorage] SET (LOCK_ESCALATION = TABLE)
GO

