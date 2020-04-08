USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectReason]
    @ReasonId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [ReasonId], [Description]
    FROM   dbo.[Reason]
    WHERE  [ReasonId] = @ReasonId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertReason] 
    @ReasonId int,
    @Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[Reason] ([ReasonId], [Description])
    SELECT @ReasonId, @Description

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateReason]
	@ReasonId int,
	@Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Reason]
    SET    Description = @Description
    WHERE  [ReasonId] = @ReasonId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteReason] 
	@ReasonId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Reason]
    WHERE  [ReasonId] = @ReasonId

    COMMIT
GO