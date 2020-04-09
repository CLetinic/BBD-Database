USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectGrade]
    @GradeId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [GradeId], [Description] 
    FROM   dbo.[Grade]
    WHERE  [GradeId] = @GradeId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertGrade] 
    @GradeId int,
    @Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[Grade] ([GradeId], [Description])
    SELECT @GradeId, @Description
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateGrade]
	@GradeId int,
	@Description varchar(55)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Grade]
    SET    [Description] = @Description
    WHERE  [GradeId] = @GradeId
    COMMIT
GO


CREATE PROCEDURE dbo.[spDeleteGrade] 
	@GradeId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Grade]
    WHERE  [GradeId] = @GradeId

    COMMIT
GO