USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectLearnerSchool]
    @LearnerSchoolId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [LearnerSchoolId], [LearnerId], [SchoolId], [EffectiveFrom], [EffectiveTo]
    FROM   dbo.[LearnerSchool]
    WHERE  [LearnerSchoolId] = @LearnerSchoolId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertLearnerSchool] 
    @LearnerSchoolId int,
    @LearnerId int,
    @SchoolId int,
    @EffectiveFrom date,
    @EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[LearnerSchool] ([LearnerSchoolId], [LearnerId], [SchoolId], [EffectiveFrom], [EffectiveTo])
    SELECT @LearnerSchoolId, @LearnerId, @SchoolId, @EffectiveFrom, @EffectiveTo

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateLearnerSchool]
@LearnerSchoolId int,
@LearnerId int,
@SchoolId int,
@EffectiveFrom date,
@EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[LearnerSchool]
    SET    [LearnerId] = @LearnerId, [SchoolId] = @SchoolId, [EffectiveFrom] = @EffectiveFrom, [EffectiveTo] = @EffectiveTo
    WHERE  [LearnerSchoolId] = @LearnerSchoolId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteLearnerSchool] 
@LearnerSchoolId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[LearnerSchool]
    WHERE  [LearnerSchoolId] = @LearnerSchoolId

    COMMIT
GO