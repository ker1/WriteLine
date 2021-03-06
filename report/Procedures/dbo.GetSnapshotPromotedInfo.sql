SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[GetSnapshotPromotedInfo]
Print 'Create Procedure [dbo].[GetSnapshotPromotedInfo]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSnapshotPromotedInfo]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit
AS

-- We don't want to hold shared locks if even if we are in a repeatable
-- read transaction, so explicitly use READCOMMITTED lock hint
IF @IsPermanentSnapshot = 1
BEGIN
   SELECT PageCount, HasDocMap, PaginationMode, ProcessingFlags
   FROM SnapshotData WITH (READCOMMITTED)
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   SELECT PageCount, HasDocMap, PaginationMode, ProcessingFlags
   FROM [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData WITH (READCOMMITTED)
   WHERE SnapshotDataID = @SnapshotDataID
END      
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
