SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[SetAllProperties]
Print 'Create Procedure [dbo].[SetAllProperties]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SetAllProperties]
@Path nvarchar (425),
@EditSessionID varchar(32) = NULL,
@Property ntext,
@Description ntext = NULL,
@Hidden bit = NULL,
@ModifiedBySid varbinary (85) = NULL,
@ModifiedByName nvarchar(260),
@AuthType int,
@ModifiedDate DateTime
AS

IF(@EditSessionID is null)
BEGIN
DECLARE @ModifiedByID uniqueidentifier
EXEC GetUserID @ModifiedBySid, @ModifiedByName, @AuthType, @ModifiedByID OUTPUT

UPDATE Catalog
SET Property = @Property, Description = @Description, Hidden = @Hidden, ModifiedByID = @ModifiedByID, ModifiedDate = @ModifiedDate
WHERE Path = @Path
END
ELSE
BEGIN
    UPDATE [ReportServer$ENTERPRISE2017TempDB].dbo.TempCatalog
    SET Property = @Property, Description = @Description
    WHERE ContextPath = @Path and EditSessionID = @EditSessionID
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
