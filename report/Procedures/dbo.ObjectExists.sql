SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[ObjectExists]
Print 'Create Procedure [dbo].[ObjectExists]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObjectExists]
@Path nvarchar (425),
@EditSessionID varchar(32) = NULL,
@OwnerSid as varbinary(85) = NULL, 
@OwnerName as nvarchar(260) = NULL,
@AuthType int
AS
BEGIN
DECLARE @OwnerID uniqueidentifier
if(@EditSessionID is not null)
BEGIN
    EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT
END

SELECT Type, ItemID, SnapshotLimit, NtSecDescPrimary, ExecutionFlag, Intermediate, [LinkSourceID], SubType, ComponentID
FROM ExtendedCatalog(@OwnerID, @Path, @EditSessionID)
LEFT OUTER JOIN SecData
ON ExtendedCatalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
