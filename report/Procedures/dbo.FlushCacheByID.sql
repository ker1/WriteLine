SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[FlushCacheByID]
Print 'Create Procedure [dbo].[FlushCacheByID]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FlushCacheByID]
@ItemID as uniqueidentifier
AS
BEGIN

DECLARE @AffectedSnapshots table (SnapshotDataID uniqueidentifier)

DELETE FROM [ReportServer$ENTERPRISE2017TempDB].dbo.ExecutionCache
OUTPUT DELETED.SnapshotDataID into @AffectedSnapshots
WHERE ReportID = @ItemID

UPDATE [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData
SET PermanentRefcount = PermanentRefcount - 1
WHERE SnapshotDataID IN (SELECT SnapshotDataID FROM @AffectedSnapshots)

END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
