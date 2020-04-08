USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectSchoolType]
    @SchoolTypeId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [SchoolTypeId], [Description], [MinGradeId], [MaxGradeId]
    FROM   dbo.[SchoolType]
    WHERE  [SchoolTypeId] = @SchoolTypeId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertSchoolType] 
    @SchoolTypeId int,
    @Description varchar(55),
    @MinGradeId int,
    @MaxGradeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[SchoolType] ([SchoolTypeId], [Description], [MinGradeId], [MaxGradeId])
    SELECT @SchoolTypeId, @Description, @MinGradeId, @MaxGradeId
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateSchoolType]
	@SchoolTypeId int,
	@Description varchar(55),
	@MinGradeId int,
	@MaxGradeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[SchoolType]
    SET    [Description] = @Description, [MinGradeId] = @MinGradeId, [MaxGradeId] = @MaxGradeId
    WHERE  [SchoolTypeId] = @SchoolTypeId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteSchoolType] 
	@SchoolTypeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[SchoolType]
    WHERE  [SchoolTypeId] = @SchoolTypeId

    COMMIT
GO