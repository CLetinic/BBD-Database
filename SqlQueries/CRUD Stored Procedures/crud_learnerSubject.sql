USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectLearnerSubject]
    @LearnerSubjectId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [LearnerSubjectId], [LearnerId], [SubjectId], [EffectiveFrom], [EffectiveTo]
    FROM   dbo.[LearnerSubject]
    WHERE  [LearnerSubjectId] = @LearnerSubjectId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertLearnerSubject] 
    @LearnerSubjectId int,
    @LearnerId int,
    @SubjectId int,
    @EffectiveFrom date,
    @EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[LearnerSubject] ([LearnerSubjectId], [LearnerId], [SubjectId], [EffectiveFrom], [EffectiveTo])
    SELECT @LearnerSubjectId, @LearnerId, @SubjectId, @EffectiveFrom, @EffectiveTo
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateLearnerSubject]
@LearnerSubjectId int,
@LearnerId int,
@SubjectId int,
@EffectiveFrom date,
@EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[LearnerSubject]
    SET    [LearnerId] = @LearnerId, [SubjectId] = @SubjectId, [EffectiveFrom] = @EffectiveFrom, [EffectiveTo] = @EffectiveTo
    WHERE  [LearnerSubjectId] = @LearnerSubjectId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteLearnerSubject] 
@LearnerSubjectId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTIONSACTION

    DELETE
    FROM   dbo.[LearnerSubject]
    WHERE  [LearnerSubjectId] = @LearnerSubjectId

    COMMIT
GO