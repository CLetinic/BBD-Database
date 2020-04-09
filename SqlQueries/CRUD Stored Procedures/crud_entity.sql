USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectEntity]
    @EntityId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [EntityId], [Name], [EntityTypeId], [ParentEntityId] 
    FROM   dbo.Entity
    WHERE  EntityId = @EntityId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertEntity] 
    @EntityId int,
    @Name varchar(55),
    @EntityTypeId int,
    @ParentEntityId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[Entity] ([EntityId], [Name], [EntityTypeId], [ParentEntityId])
    SELECT @EntityId, @Name, @EntityTypeId, @ParentEntityId

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateEntity]
	@EntityId int,
	@Name varchar(55),
	@EntityTypeId int,
	@ParentEntityId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Entity]
    SET    [Name] = @Name, [EntityTypeId] = @EntityTypeId, [ParentEntityId] = @ParentEntityId
    WHERE  [EntityId] = @EntityId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteEntity]
	@EntityId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Entity]
    WHERE  [EntityId] = @EntityId

    COMMIT
GO