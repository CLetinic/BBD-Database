USE [SchoolSystem]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Get the number of schooldays between two dates
-- Use (Ex) : SELECT [dbo].[getSchoolDays]('2018-01-01','2018-08-31')
-- ====================================================================
CREATE FUNCTION [dbo].[getSchoolDays]
(
	-- Add the parameters for the function here
	@StartDate date,
	@EndDate date
)
RETURNS INT
AS
BEGIN
	
	DECLARE @PulbicHolidays int = ( SELECT [dbo].[getPublicHolidays](@StartDate,@EndDate))
	DECLARE @WeekDays int
		
	;WITH cteSequence ( SeqNo) as
	(
		  SELECT 1  UNION ALL SELECT SeqNo + 1
		  FROM cteSequence
		  WHERE SeqNo < DATEDIFF(DD, @StartDate, @EndDate)+1
	)
	SELECT @WeekDays = COUNT(*) 
	FROM   (SELECT TOP ( datediff(DAY,@StartDate,@EndDate) + 1 )
							[Date] = dateadd(DAY,ROW_NUMBER()
					  OVER(ORDER BY c1.SeqNo),
					  DATEADD(DD,-1,@StartDate))
			FROM   cteSequence c1 ) x
	JOIN YearTerm YT ON [Date] BETWEEN YT.StartDate AND YT.EndDate
	WHERE  datepart(dw,[Date]) NOT IN (1,7) 
	option (maxrecursion 0)

	
	RETURN @WeekDays-@PulbicHolidays;

END

GO


