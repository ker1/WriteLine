SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[AddExecutionLogEntry]
Print 'Create Procedure [dbo].[AddExecutionLogEntry]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddExecutionLogEntry]
@InstanceName nvarchar(38),
@Report nvarchar(260),
@UserSid varbinary(85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@RequestType tinyint,
@Format nvarchar(26),
@Parameters ntext,
@TimeStart DateTime,
@TimeEnd DateTime,
@TimeDataRetrieval int,
@TimeProcessing int,
@TimeRendering int,
@Source tinyint,
@Status nvarchar(40),
@ByteCount bigint,
@RowCount bigint,
@ExecutionId nvarchar(64) = null,
@ReportAction tinyint, 
@AdditionalInfo xml = null
AS

-- Unless is is specifically 'False', it's true
if exists (select * from ConfigurationInfo where [Name] = 'EnableExecutionLogging' and [Value] like 'False')
begin
return
end

Declare @ReportID uniqueidentifier
select @ReportID = ItemID from Catalog with (nolock) where Path = @Report

insert into ExecutionLogStorage
(InstanceName, ReportID, UserName, ExecutionId, RequestType, [Format], Parameters, ReportAction, TimeStart, TimeEnd, TimeDataRetrieval, TimeProcessing, TimeRendering, Source, Status, ByteCount, [RowCount], AdditionalInfo)
Values
(@InstanceName, @ReportID, @UserName, @ExecutionId, @RequestType, @Format, @Parameters, @ReportAction, @TimeStart, @TimeEnd, @TimeDataRetrieval, @TimeProcessing, @TimeRendering, @Source, @Status, @ByteCount, @RowCount, @AdditionalInfo)
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
