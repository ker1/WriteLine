SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[UpgradeSharePointSchedulePaths]
Print 'Create Procedure [dbo].[UpgradeSharePointSchedulePaths]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpgradeSharePointSchedulePaths]
    @OldPath nvarchar(440),
    @NewPath nvarchar(440)

AS
BEGIN
-- Update Path if the pair (Name, NewPath) is unique.
UPDATE [Schedule]
  SET [Path] = @NewPath
  WHERE [Path] = @OldPath
  AND NOT EXISTS (SELECT [Name] FROM [Schedule] AS S2
                    WHERE S2.[Path] = @NewPath
                    AND S2.[Name] = [Schedule].[Name])

-- If any paths were not updated in the first pass, generate a unique name.
-- Update Name, Path to (Name + "(<ScheduleID>)", NewPath)
UPDATE [Schedule]
  SET [Path] = @NewPath,
       [Name] = [Name] + ' (' + CAST([ScheduleID] AS NCHAR(36)) + ')'
  WHERE [Path] = @OldPath
  AND NOT EXISTS (SELECT [Name] FROM [Schedule] AS S2
                    WHERE S2.[Path] = @NewPath
                    AND S2.[Name] = [Schedule].[Name] + ' (' + CAST([Schedule].[ScheduleID] AS NCHAR(36)) + ')')
END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
