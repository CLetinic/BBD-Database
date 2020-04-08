USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectEducatorAbsent]
    @EducatorAbsentId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [EducatorAbsentId], [EducatorId], [ReasonId], [Date]
    FROM   dbo.[EducatorAbsent]
    WHERE  [EducatorAbsentId] = @EducatorAbsentId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertEducatorAbsent] 
    @Rundate date null,
	@EducatorId int
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

			INSERT INTO EducatorAbsent(EducatorId,[Date])
			VALUES (@EducatorId, @Rundate)
		END
	
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateEducatorAbsent]
	@EducatorAbsentId int,
	@EducatorId int,
	@ReasonId int,
	@Date date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[EducatorAbsent]
    SET    [EducatorId] = @EducatorId, [ReasonId] = @ReasonId, [Date] = @Date
    WHERE  [EducatorAbsentId] = @EducatorAbsentId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteEducatorAbsent] 
	@EducatorAbsentId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[EducatorAbsent]
    WHERE  [EducatorAbsentId] = @EducatorAbsentId

    COMMIT
GO