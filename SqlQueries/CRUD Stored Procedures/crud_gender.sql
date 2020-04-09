USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectGender]
    @GenderId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [GenderId], [Description]
    FROM   dbo.[Gender]
    WHERE  [GenderId] = @GenderId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertGender]
    @GenderId int,
    @Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[Gender] ([GenderId], [Description])
    SELECT @GenderId, @Description

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateGender]
@GenderId int,
@Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Gender]
    SET    [Description] = @Description
    WHERE  [GenderId] = @GenderId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteGender] 
@GenderId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Gender]
    WHERE  [GenderId] = @GenderId

    COMMIT
GO