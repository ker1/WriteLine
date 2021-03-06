SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[CleanBrokenSnapshots]
Print 'Create Procedure [dbo].[CleanBrokenSnapshots]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CleanBrokenSnapshots]
@Machine nvarchar(512),
@SnapshotsCleaned int OUTPUT,
@ChunksCleaned int OUTPUT,
@TempSnapshotID uniqueidentifier OUTPUT
AS
    SET DEADLOCK_PRIORITY LOW
    DECLARE @now AS datetime
    SELECT @now = GETDATE()
    
    CREATE TABLE #tempSnapshot (SnapshotDataID uniqueidentifier)
    INSERT INTO #tempSnapshot SELECT TOP 1 SnapshotDataID 
    FROM SnapshotData  WITH (NOLOCK) 
    where SnapshotData.PermanentRefcount <= 0 
    AND ExpirationDate < @now
    SET @SnapshotsCleaned = @@ROWCOUNT

    DELETE ChunkData FROM ChunkData INNER JOIN #tempSnapshot
    ON ChunkData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    SET @ChunksCleaned = @@ROWCOUNT

    DELETE SnapshotData FROM SnapshotData INNER JOIN #tempSnapshot
    ON SnapshotData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    
    TRUNCATE TABLE #tempSnapshot

    INSERT INTO #tempSnapshot SELECT TOP 1 SnapshotDataID 
    FROM [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData  WITH (NOLOCK) 
    where [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData.PermanentRefcount <= 0 
    AND [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData.ExpirationDate < @now
    AND [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData.Machine = @Machine
    SET @SnapshotsCleaned = @SnapshotsCleaned + @@ROWCOUNT

    SELECT @TempSnapshotID = (SELECT SnapshotDataID FROM #tempSnapshot)

    DELETE [ReportServer$ENTERPRISE2017TempDB].dbo.ChunkData FROM [ReportServer$ENTERPRISE2017TempDB].dbo.ChunkData INNER JOIN #tempSnapshot
    ON [ReportServer$ENTERPRISE2017TempDB].dbo.ChunkData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    SET @ChunksCleaned = @ChunksCleaned + @@ROWCOUNT

    DELETE [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData FROM [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData INNER JOIN #tempSnapshot
    ON [ReportServer$ENTERPRISE2017TempDB].dbo.SnapshotData.SnapshotDataID = #tempSnapshot.SnapshotDataID
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
