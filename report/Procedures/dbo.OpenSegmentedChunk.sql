SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[OpenSegmentedChunk]
Print 'Create Procedure [dbo].[OpenSegmentedChunk]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[OpenSegmentedChunk]
	@SnapshotId		uniqueidentifier,
	@IsPermanent	bit,
	@ChunkName		nvarchar(260), 
	@ChunkType		int, 
	@ChunkId        uniqueidentifier out, 
	@ChunkFlags     tinyint out
as begin    
	if (@IsPermanent = 1) begin		
		select	@ChunkId = ChunkId,
				@ChunkFlags = ChunkFlags
		from dbo.SegmentedChunk chunk
		where chunk.SnapshotDataId = @SnapshotId and chunk.ChunkName = @ChunkName and chunk.ChunkType = @ChunkType
		
		select	csm.SegmentId, 				
				csm.LogicalByteCount as LogicalSegmentLength, 
				csm.ActualByteCount as ActualSegmentLength		
		from ChunkSegmentMapping csm		
		where csm.ChunkId = @ChunkId
		order by csm.StartByte asc
	end
	else begin
		select	@ChunkId = ChunkId,
				@ChunkFlags = ChunkFlags
		from [ReportServer$ENTERPRISE2017TempDB].dbo.SegmentedChunk chunk
		where chunk.SnapshotDataId = @SnapshotId and chunk.ChunkName = @ChunkName and chunk.ChunkType = @ChunkType

		if @ChunkFlags & 0x4 > 0 begin
			-- Shallow copy: read chunk segments from catalog 
			select	csm.SegmentId, 				
					csm.LogicalByteCount as LogicalSegmentLength, 
					csm.ActualByteCount as ActualSegmentLength		
			from ChunkSegmentMapping csm		
			where csm.ChunkId = @ChunkId
			order by csm.StartByte asc
		end
		else begin
			-- Regular copy: read chunk segments from temp db
			select	csm.SegmentId, 				
					csm.LogicalByteCount as LogicalSegmentLength, 
					csm.ActualByteCount as ActualSegmentLength		
			from [ReportServer$ENTERPRISE2017TempDB].dbo.ChunkSegmentMapping csm		
			where csm.ChunkId = @ChunkId
			order by csm.StartByte asc
		end
	end
end
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
