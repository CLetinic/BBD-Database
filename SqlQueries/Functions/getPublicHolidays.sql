-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION getPublicHolidays
(
	-- Add the parameters for the function here
	@StartDate date,
	@EndDate date
)
RETURNS INT
AS
BEGIN
	
	DECLARE @StartYear int = YEAR(@StartDate), @EndYear int = YEAR(@EndDate)
	
	DECLARE @PublicHolidays TABLE
	(
		[Day] int,
		[Month] int,
		[Year] int,
		[Description] varchar(55)
		
	)
	INSERT INTO @PublicHolidays([Day],[Month],[Description])
	VALUES	(01,01,'New Years Day'),
			(21,03,'Human Rights Day'),
			(30,03,'Good Friday'),
			(02,04,'Family Day'),
			(27,04,'Freedom Day'),
			(01,05,'Workers Day'),
			(16,06,'Youth Day'),
			(09,08,'National Womens Day'),
			(24,09,'Heritage Day'),
			(16,12,'Day of Reconciliation'),
			(17,12,'Day of Reconciliation Holiday'),
			(25,12,'Christmas Day'),
			(26,12,'Day of Goodwill')

	;
	WITH [years] AS (
		SELECT @StartYear AS [year]
		UNION ALL
		SELECT [year]+1 FROM [years] WHERE [year]+1<=@EndYear
	)
	INSERT INTO @PublicHolidays([Day],[Month],[Year],[Description])
	SELECT PH.[Day],PH.[Month],[years].[year],[Description] FROM [years]
	CROSS JOIN @PublicHolidays PH
	

	DELETE FROM @PublicHolidays WHERE [Year] IS NULL
	
	--delete saturdays OR days not between start and end
	DELETE  
	FROM @PublicHolidays 
	WHERE (DATEPART(WEEKDAY,DATEFROMPARTS([Year] ,[Month], [Day])) = 7 ) OR (DATEFROMPARTS([Year] ,[Month], [Day]) NOT BETWEEN @StartDate AND @EndDate)
	
	--select the public holidays that fall within the term(s)	
	DECLARE @PublicHolidayCount int
	SELECT @PublicHolidayCount = COUNT(*)
	FROM YearTerm YT
	JOIN @PublicHolidays PH ON DATEFROMPARTS(PH.[Year] ,PH.[Month], PH.[Day]) BETWEEN YT.StartDate AND YT.EndDate

	RETURN @PublicHolidayCount;

END
GO


