SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[AddHistoryRecord]
Print 'Create Procedure [dbo].[AddHistoryRecord]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- add new record to History table
CREATE PROCEDURE [dbo].[AddHistoryRecord]
@HistoryID uniqueidentifier,
@ReportID uniqueidentifier,
@SnapshotDate datetime,
@SnapshotDataID uniqueidentifier,
@SnapshotTransientRefcountChange int
AS
INSERT
INTO History (HistoryID, ReportID, SnapshotDataID, SnapshotDate)
VALUES (@HistoryID, @ReportID, @SnapshotDataID, @SnapshotDate)

IF @@ERROR = 0
BEGIN
   UPDATE SnapshotData
   -- Snapshots, when created, have transient refcount set to 1. Here create permanent reference
   -- here so we need to increase permanent refcount and decrease transient refcount. However,
   -- if it was already referenced by the execution snapshot, transient refcount was already
   -- decreased. Hence, there's a parameter @SnapshotTransientRefcountChange that is 0 or -1.
   SET PermanentRefcount = PermanentRefcount + 1, TransientRefcount = TransientRefcount + @SnapshotTransientRefcountChange
   WHERE SnapshotData.SnapshotDataID = @SnapshotDataID
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
