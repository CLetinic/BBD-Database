SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Insert a absent date for a educator 
-- Use (Ex) : EXEC InsertAbsentEducator'2018-02-31', 1
-- ====================================================================
CREATE PROCEDURE InsertAbsentEducator
	@Rundate date null,
	@EducatorId int
AS
BEGIN

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
	
END
GO


