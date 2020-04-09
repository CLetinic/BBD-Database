-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
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
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Insert a absent date for a educator 
-- Use (Ex) : SELECT * FROM dbo.getEntityLearnerAttendance('2018-01-01', '2018-01-31', 5)
-- =============================================
CREATE FUNCTION dbo.getEntityLearnerAttendance
(
	@StartDate date ,
	@EndDate date,
	@EntityId int
)
RETURNS 
@Learners TABLE
(
		LearnerId int,
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

	INSERT INTO @Learners
	SELECT Attendance.LearnerId, ISNULL(100.0* (Attendance.weekdays - Attendance.daysAbsent)/NULLIF(Attendance.weekdays,0),0) [Perc], Attendance.SchoolId, Attendance.ProvinceId, Attendance.CountryId		
	FROM 
		(	SELECT L.LearnerId, ISNULL(B.[daysAbsent],0)[daysAbsent], CASE WHEN A.LearnerId IS NOT NULL THEN dbo.getSchoolDays(A.[start],A.[end]) 
																		   ELSE null 
																	  END [weekdays], S.SchoolId, S.ProvinceId, S.CountryId															
			FROM Learner L
			JOIN LearnerSchool LS ON LS.LearnerId = L.LearnerId
			JOIN @Schools S ON S.SchoolId = LS.SchoolId
			LEFT OUTER JOIN (
						SELECT DISTINCT LS.LearnerId, CASE WHEN LS.EffectiveFrom > @StartDate THEN LS.EffectiveFrom
														ELSE @StartDate
														END [start], --start
													  CASE WHEN LS.EffectiveTo < @EndDate THEN LS.EffectiveTo
														ELSE @EndDate
														END [end] --end
						FROM YearTerm YT
						JOIN LearnerSubject LS ON YT.[StartDate] <= LS.EffectiveTo  AND YT.EndDate >= LS.[EffectiveFrom]
						WHERE [StartDate] <= @EndDate AND [EndDate] >= @StartDate 
					) A ON A.LearnerId = L.LearnerId
			LEFT OUTER JOIN 
						(
							SELECT LA.LearnerId, COUNT(LA.LearnerAbsentId) [daysAbsent]
							FROM LearnerAbsent LA
							WHERE LA.[Date] BETWEEN @StartDate AND @EndDate
							GROUP BY LA.LearnerId
						)B ON B.LearnerId = L.LearnerId
			--WHERE A.LearnerId IS NOT NULL --AND L.LearnerId = 2118
		 ) Attendance

	RETURN 
END
GO