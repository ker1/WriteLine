SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[GetFirstPortionPersistedStream]
Print 'Create Procedure [dbo].[GetFirstPortionPersistedStream]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFirstPortionPersistedStream]
@SessionID varchar(32)
AS

SELECT 
    TOP 1
    TEXTPTR(P.Content), 
    DATALENGTH(P.Content), 
    P.[Index],
    P.[Name], 
    P.MimeType, 
    P.Extension, 
    P.Encoding,
    P.Error
FROM 
    [ReportServer$ENTERPRISE2017TempDB].dbo.PersistedStream P WITH (XLOCK)
WHERE 
    P.SessionID = @SessionID
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
