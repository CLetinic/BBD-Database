USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectSchool]
    @SchoolId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [SchoolId], [EntityId], [SchoolTypeId]
    FROM   dbo.[School]
    WHERE  [SchoolId] = @SchoolId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertSchool]
    @EntityName varchar(100),
	@ParentEntityId int,
	@SchoolTypeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO [dbo].[Entity]([Name], [EntityTypeId], [ParentEntityId])
	VALUES (@EntityName ,3 , @ParentEntityId)

	DECLARE @EntityId int = @@Identity;

	INSERT INTO School([EntityId],[SchoolTypeId])
	VALUES(@EntityId, @SchoolTypeId)

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateSchool]
	@SchoolId int,
	@EntityId int,
	@SchoolTypeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[School]
    SET    [EntityId] = @EntityId, [SchoolTypeId] = @SchoolTypeId
    WHERE  [SchoolId] = @SchoolId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteSchool]
	@SchoolId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[School]
    WHERE  [SchoolId] = @SchoolId

    COMMIT
GO