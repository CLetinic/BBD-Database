-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
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
CREATE FUNCTION dbo.getEntityEducatorAttendance
(
	@StartDate date ,
	@EndDate date,
	@EntityId int
)
RETURNS 
@Educators TABLE
(
		EducatorId int,
		Attendance decimal(8,2),
		SchoolId int,
		ProvinceId int,
		CountryId int
)
AS
BEGIN
	
	DECLARE @Schools TABLE
	(
		SchoolId int,
		ProvinceId int,
		CountryId int
	)

	INSERT INTO @Schools
	SELECT * FROM dbo.getSchoolsInEntity(@EntityId)

	INSERT INTO @Educators
	SELECT Attendance.EducatorId, ISNULL(100.0* (Attendance.weekdays - Attendance.daysAbsent)/NULLIF(Attendance.weekdays,0),0) [Perc], Attendance.SchoolId, Attendance.ProvinceId, Attendance.CountryId		
	FROM 
		(	SELECT E.EducatorId, ISNULL(B.[daysAbsent],0)[daysAbsent], CASE WHEN A.EducatorId IS NOT NULL THEN dbo.getSchoolDays(A.[start],A.[end]) 
																		   ELSE null 
																	  END [weekdays], S.SchoolId, S.ProvinceId, S.CountryId															
			FROM Educator E
			JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
			JOIN @Schools S ON S.SchoolId = ES.SchoolId
			LEFT OUTER JOIN (
						SELECT DISTINCT ES.EducatorId, CASE WHEN ES.EffectiveFrom > @StartDate THEN ES.EffectiveFrom
														ELSE @StartDate
														END [start], --start
													  CASE WHEN ES.EffectiveTo < @EndDate THEN ES.EffectiveTo
														ELSE @EndDate
														END [end] --end
						FROM YearTerm YT
						JOIN EducatorSubject ES ON YT.[StartDate] <= ES.EffectiveTo  AND YT.EndDate >= ES.[EffectiveFrom]
						WHERE [StartDate] <= @EndDate AND [EndDate] >= @StartDate 
					) A ON A.EducatorId = E.EducatorId
			LEFT OUTER JOIN 
						(
							SELECT EA.EducatorId, COUNT(EA.EducatorAbsentId) [daysAbsent]
							FROM EducatorAbsent EA
							WHERE EA.[Date] BETWEEN @StartDate AND @EndDate
							GROUP BY EA.EducatorId
						)B ON B.EducatorId = E.EducatorId
			--WHERE A.EducatorId IS NOT NULL --AND E.EducatorId = 2118
		 ) Attendance

	RETURN 
END
GO

-- =============================================
-- TEST
-- =============================================
--SELECT * FROM dbo.getEntityEducatorAttendance('2018-01-01', '2018-01-31', 5)
--GO