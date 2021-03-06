SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[UpdateSnapshotReferences]
Print 'Create Procedure [dbo].[UpdateSnapshotReferences]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSnapshotReferences]
	@OldSnapshotId UNIQUEIDENTIFIER, 
	@NewSnapshotId UNIQUEIDENTIFIER,
	@IsPermanentSnapshot BIT,
	@TransientRefCountModifier INT,
	@UpdatedReferences INT OUTPUT	
AS 
BEGIN	
	SET @UpdatedReferences = 0
	
	IF(@IsPermanentSnapshot = 1)
	BEGIN
		-- Update Snapshot Executions		
		UPDATE [dbo].[Catalog]
		SET [SnapshotDataID] = @NewSnapshotId
		WHERE [SnapshotDataID] = @OldSnapshotId

		SELECT @UpdatedReferences = @UpdatedReferences + @@ROWCOUNT

		-- Update History
		UPDATE [dbo].[History]
		SET [SnapshotDataID] = @NewSnapshotId
		WHERE [SnapshotDataID] = @OldSnapshotId

		SELECT @UpdatedReferences = @UpdatedReferences + @@ROWCOUNT

		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] - @UpdatedReferences,
			[TransientRefcount] = [TransientRefcount] + @TransientRefCountModifier
		WHERE [SnapshotDataID] = @OldSnapshotId

		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] + @UpdatedReferences
		WHERE [SnapshotDataID] = @NewSnapshotId
	END
	ELSE
	BEGIN
		-- Update Execution Cache
		UPDATE [ReportServer$ENTERPRISE2017TempDB].dbo.[ExecutionCache]
		SET [SnapshotDataID] = @NewSnapshotId
		WHERE [SnapshotDataID] = @OldSnapshotId
		
		SELECT @UpdatedReferences = @UpdatedReferences + @@ROWCOUNT
		
		UPDATE [ReportServer$ENTERPRISE2017TempDB].dbo.[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] - @UpdatedReferences,
			[TransientRefcount] = [TransientRefcount] + @TransientRefCountModifier
		WHERE [SnapshotDataID] = @OldSnapshotId

		UPDATE [ReportServer$ENTERPRISE2017TempDB].dbo.[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] + @UpdatedReferences
		WHERE [SnapshotDataID] = @NewSnapshotId
	END
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
