SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[SetKeysForInstallation]
Print 'Create Procedure [dbo].[SetKeysForInstallation]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SetKeysForInstallation]
@InstallationID uniqueidentifier,
@SymmetricKey image = NULL,
@PublicKey image
AS

update [dbo].[Keys]
set [SymmetricKey] = @SymmetricKey, [PublicKey] = @PublicKey
where [InstallationID] = @InstallationID and [Client] = 1
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
