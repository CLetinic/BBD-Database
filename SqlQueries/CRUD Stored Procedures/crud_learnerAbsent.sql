USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectLearnerAbsent]
    @LearnerAbsentId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [LearnerAbsentId], [LearnerId], [Date] 
    FROM   dbo.[LearnerAbsent]
    WHERE  [LearnerAbsentId] = @LearnerAbsentId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertLearnerAbsent] 
    @Rundate date null,
	@LearnerId int
AS 
    SET NOCOUNT ON;

	IF @Rundate IS NULL
		BEGIN
			SET @Rundate = GETDATE()
		END
	DECLARE @YearTermId int = (SELECT MAX(YearTermId) FROM YearTerm WHERE @Rundate BETWEEN StartDate AND EndDate)

	--check if weekday or public holiday or not in term
	IF DATEPART(WEEKDAY, @Rundate) NOT IN  (6,7) AND (SELECT [dbo].[getPublicHolidays](@Rundate, @Rundate)) < 1 AND (@YearTermId IS NOT NULL)
		BEGIN
			INSERT INTO LearnerAbsent([LearnerId],[Date])
			VALUES (@LearnerId, @Rundate)
		END
	COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateLearnerAbsent]
	@LearnerAbsentId int,
	@LearnerId int,
	@Date date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[LearnerAbsent]
    SET    [LearnerId] = @LearnerId, [Date] = @Date
    WHERE  [LearnerAbsentId] = @LearnerAbsentId

    COMMIT
GO


CREATE PROCEDURE dbo.[spDeleteLearnerAbsent] 
	@LearnerAbsentId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[LearnerAbsent]
    WHERE  [LearnerAbsentId] = @LearnerAbsentId

    COMMIT
GO