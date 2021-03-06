SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[UpdateCompiledDefinition]
Print 'Create Procedure [dbo].[UpdateCompiledDefinition]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateCompiledDefinition]
	@Path				NVARCHAR(425),
	@OldSnapshotId		UNIQUEIDENTIFIER,
	@NewSnapshotId		UNIQUEIDENTIFIER,
	@ItemId				UNIQUEIDENTIFIER OUTPUT
AS BEGIN
	-- we have a clustered unique index on [Path] which the QO 
	-- should match for the filter
	UPDATE [dbo].[Catalog]
	SET [Intermediate] = @NewSnapshotId,
		@ItemId = [ItemID]
	WHERE [Path] = @Path AND 
	      ([Intermediate] = @OldSnapshotId OR (@OldSnapshotId IS NULL AND [Intermediate] IS NULL));
	
	DECLARE @UpdatedReferences INT ;
	SELECT @UpdatedReferences = @@ROWCOUNT ;
	
	IF(@UpdatedReferences <> 0)
	BEGIN
		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] + @UpdatedReferences,
			[TransientRefcount] = [TransientRefcount] - 1
		WHERE [SnapshotDataID] = @NewSnapshotId ;
		
		UPDATE [dbo].[SnapshotData]
		SET [PermanentRefcount] = [PermanentRefcount] - @UpdatedReferences
		WHERE [SnapshotDataID] = @OldSnapshotId ;
	END
END

GRANT EXECUTE ON [dbo].[UpdateCompiledDefinition] TO RSExecRole
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
