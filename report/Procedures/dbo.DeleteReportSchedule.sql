SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[DeleteReportSchedule]
Print 'Create Procedure [dbo].[DeleteReportSchedule]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteReportSchedule]
@ScheduleID uniqueidentifier,
@ReportID uniqueidentifier,
@SubscriptionID uniqueidentifier = NULL,
@ReportAction int
AS

IF @SubscriptionID is NULL
BEGIN
delete from ReportSchedule where ScheduleID = @ScheduleID and ReportID = @ReportID and ReportAction = @ReportAction
END
ELSE
BEGIN
delete from ReportSchedule where ScheduleID = @ScheduleID and ReportID = @ReportID and ReportAction = @ReportAction and SubscriptionID = @SubscriptionID
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
