SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[DeleteOneChunk]
Print 'Create Procedure [dbo].[DeleteOneChunk]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteOneChunk]
@SnapshotID uniqueidentifier,
@IsPermanentSnapshot bit,
@ChunkName nvarchar(260),
@ChunkType int
AS
SET NOCOUNT OFF
-- for segmented chunks we just need to 
-- remove the mapping, the cleanup thread
-- will pick up the rest of the pieces
IF @IsPermanentSnapshot != 0 BEGIN

DELETE ChunkData
WHERE   
    SnapshotDataID = @SnapshotID AND
    ChunkName = @ChunkName AND
    ChunkType = @ChunkType
    
DELETE	SegmentedChunk
WHERE 	
	SnapshotDataId = @SnapshotID AND
	ChunkName = @ChunkName AND
	ChunkType = @ChunkType
    
END ELSE BEGIN

DELETE [ReportServer$ENTERPRISE2017TempDB].dbo.ChunkData
WHERE   
    SnapshotDataID = @SnapshotID AND
    ChunkName = @ChunkName AND
    ChunkType = @ChunkType

DELETE	[ReportServer$ENTERPRISE2017TempDB].dbo.SegmentedChunk
WHERE 	
	SnapshotDataId = @SnapshotID AND
	ChunkName = @ChunkName AND
	ChunkType = @ChunkType

END    
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
