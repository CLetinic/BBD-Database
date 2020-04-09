USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectLearnerSubjectMark]
    @LearnerSubjectMarkId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [LearnerSubjectMarkId], [LearnerSubjectId], [YearTermId], [Percentage] 
    FROM   dbo.[LearnerSubjectMark]
    WHERE  [LearnerSubjectMarkId] = @LearnerSubjectMarkId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertLearnerSubjectMark]
    @LearnerSubjectMarkId int,
    @LearnerSubjectId int,
    @YearTermId int,
    @Percentage decimal(8, 2)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[LearnerSubjectMark] ([LearnerSubjectMarkId], [LearnerSubjectId], [YearTermId], [Percentage])
    SELECT @LearnerSubjectMarkId, @LearnerSubjectId, @YearTermId, @Percentage

    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateLearnerSubjectMark]
	@LearnerSubjectMarkId int,
	@LearnerSubjectId int,
	@YearTermId int,
	@Percentage decimal(8, 2)
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[LearnerSubjectMark]
    SET    [LearnerSubjectId] = @LearnerSubjectId, [YearTermId] = @YearTermId, [Percentage] = @Percentage
    WHERE  [LearnerSubjectMarkId] = @LearnerSubjectMarkId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteLearnerSubjectMark] 
	@LearnerSubjectMarkId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[LearnerSubjectMark]
    WHERE  [LearnerSubjectMarkId] = @LearnerSubjectMarkId

    COMMIT
GO