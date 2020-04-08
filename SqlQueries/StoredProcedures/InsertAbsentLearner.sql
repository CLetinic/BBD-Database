-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Insert a absent date for a learner 
-- Use (Ex) : EXEC InsertAbsentLearner'2018-02-31', 1
-- ====================================================================
CREATE PROCEDURE InsertAbsentLearner
	@Rundate date null,
	@LearnerId int
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
			INSERT INTO LearnerAbsent([LearnerId],[Date])
			VALUES (@LearnerId, @Rundate)
		END
	
END
GO


