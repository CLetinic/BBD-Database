USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectSubject]
    @SubjectId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [SubjectId], [GradeId], [Description], [Required], [PassPercentage] 
    FROM   dbo.[Subject]
    WHERE  [SubjectId] = @SubjectId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertSubject]
    @SubjectId int,
    @GradeId int,
    @Description varchar(55),
    @Required bit,
    @PassPercentage decimal(8, 2)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.Subject ([SubjectId], [GradeId], [Description], [Required], [PassPercentage])
    SELECT @SubjectId, @GradeId, @Description, @Required, @PassPercentage
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateSubject]
	@SubjectId int,
	@GradeId int,
	@Description varchar(55),
	@Required bit,
	@PassPercentage decimal(8, 2)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Subject]
    SET    [GradeId] = @GradeId, [Description] = @Description, [Required] = @Required, [PassPercentage] = @PassPercentage
    WHERE  [SubjectId] = @SubjectId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteSubject]
	@SubjectId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Subject]
    WHERE  [SubjectId] = @SubjectId

    COMMIT
GO