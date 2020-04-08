USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectEducatorSubject]
    @EducatorSubjectId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [EducatorSubjectId], [EducatorId], [SubjectId], [EffectiveFrom], [EffectiveTo] 
    FROM   dbo.[EducatorSubject]
    WHERE  [EducatorSubjectId] = @EducatorSubjectId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateEducatorSubject]
	@EducatorSubjectId int,
	@EducatorId int,
	@SubjectId int,
	@EffectiveFrom date,
	@EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[EducatorSubject]
    SET    [EducatorId] = @EducatorId, [SubjectId] = @SubjectId, [EffectiveFrom] = @EffectiveFrom, [EffectiveTo] = @EffectiveTo
    WHERE  [EducatorSubjectId] = @EducatorSubjectId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteEducatorSubject] 
	@EducatorSubjectId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[EducatorSubject]
    WHERE  [EducatorSubjectId] = @EducatorSubjectId

    COMMIT
GO