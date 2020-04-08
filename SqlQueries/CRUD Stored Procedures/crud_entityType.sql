USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectEntityType]
    @EntityTypeId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [EntityTypeId], [Description] 
    FROM   dbo.[EntityType]
    WHERE  [EntityTypeId] = @EntityTypeId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertEntityType] 
    @EntityTypeId int,
    @Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[EntityType] ([EntityTypeId], [Description])
    SELECT @EntityTypeId, @Description
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateEntityType]
	@EntityTypeId int,
	@Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[EntityType]
    SET    [Description] = @Description
    WHERE  [EntityTypeId] = @EntityTypeId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteEntityType] 
	@EntityTypeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[EntityType]
    WHERE  [EntityTypeId] = @EntityTypeId

    COMMIT
GO