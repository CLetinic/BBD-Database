USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectYearTerm]
    @YearTermId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [YearTermId], [Year], [Term], [StartDate], [EndDate]
    FROM   dbo.[YearTerm]
    WHERE  [YearTermId] = @YearTermId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertYearTerm]
    @YearTermId int,
    @Year int,
    @Term int,
    @StartDate date,
    @EndDate date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[YearTerm] ([YearTermId], [Year], [Term], [StartDate], [EndDate])
    SELECT @YearTermId, @Year, @Term, @StartDate, @EndDate
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateYearTerm]
	@YearTermId int,
	@Year int,
	@Term int,
	@StartDate date,
	@EndDate date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[YearTerm]
    SET    Year = @Year, Term = @Term, StartDate = @StartDate, EndDate = @EndDate
    WHERE  [YearTermId] = @YearTermId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteYearTerm]
	@YearTermId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[YearTerm]
    WHERE  [YearTermId] = @YearTermId

    COMMIT
GO