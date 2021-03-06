SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Procedure [dbo].[DeleteSubscription]
Print 'Create Procedure [dbo].[DeleteSubscription]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteSubscription] 
@SubscriptionID uniqueidentifier
AS
    -- Delete the subscription
    delete from [Subscriptions] where [SubscriptionID] = @SubscriptionID
    -- Delete it from the SubscriptionsBeingDeleted
    EXEC RemoveSubscriptionFromBeingDeleted @SubscriptionID
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
