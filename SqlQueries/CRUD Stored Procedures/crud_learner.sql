USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectLearner]
    @LearnerId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [LearnerId], [FirstName], [LastName], [IDNumber], [BirthDate], [GenderId] 
    FROM   dbo.[Learner]
    WHERE  [LearnerId] = @LearnerId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertLearner]
    @FirstName varchar(100),
	@LastName varchar(100),
	@GenderId int,
	@BirthDate date,
	@IdNumber varchar(13),
	@SchoolId int,
	@GradeId int,
	@EffectiveFrom date = null
AS 
   SET NOCOUNT ON;

	IF @EffectiveFrom IS NULL
	BEGIN
		SET @EffectiveFrom = GETDATE()
	END

	INSERT INTO [dbo].[Learner] ([FirstName],[LastName],[IDNumber],[BirthDate],[GenderId])
	VALUES (@FirstName,@LastName, @IdNumber, @BirthDate, @GenderId)

	DECLARE @LearnerId int = @@Identity;

	INSERT INTO LearnerSchool(LearnerId, SchoolId, EffectiveFrom, EffectiveTo)
	VALUES (@LearnerId,@SchoolId,@EffectiveFrom,'9999-12-31')

	IF(@GradeId<7)
	BEGIN
		INSERT INTO LearnerSubject(LearnerId, SubjectId, EffectiveFrom, EffectiveTo)
		SELECT @LearnerId, S.SubjectId, GETDATE(), '9999-12-31'
		FROM getGradeSubjects(@GradeId) S
	END
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateLearner]
	@LearnerId int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@IDNumber varchar(13),
	@BirthDate date,
	@GenderId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Learner]
    SET    [FirstName] = @FirstName, [LastName] = @LastName, [IDNumber] = @IDNumber, [BirthDate] = @BirthDate, 
           [GenderId] = @GenderId
    WHERE  [LearnerId] = @LearnerId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteLearner]
	@LearnerId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Learner]
    WHERE  [LearnerId] = @LearnerId

    COMMIT
GO