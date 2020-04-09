SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<van Zyl,,S>
-- Create date: <2020-04-08>
-- Description:	Promotes learners based on end of year marks
-- Example: EXEC EndOfYearLearnerPromotion '2019-01-01'
-- =============================================
CREATE PROCEDURE EndOfYearLearnerPromotion
	@RunDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @YearTermId int = (SELECT MAX(YearTermId) FROM YearTerm where @RunDate > [StartDate])

	IF (SELECT YearTermId FROM YearTerm WHERE @RunDate BETWEEN [StartDate] and [EndDate]) IS NULL
		SET  @YearTermId = @YearTermId + 1

	IF (SELECT Term FROM YearTerm where YearTermId = @YearTermId) = 1 AND (SELECT COUNT(EffectiveFrom) FROM LearnerSubject LS WHERE LS.EffectiveTo > @RunDate) = 0
		BEGIN
			DECLARE @PrevYearTermId int = @YearTermId -1 
			IF OBJECT_ID('tempdb..#RegisteredLearners') IS NOT NULL DROP TABLE #RegisteredLearners

			CREATE TABLE #RegisteredLearners
			(
				LearnerId int,
				SubjectsTaken int,
				SubjectsPassed int,
				Pass bit,
				GradeId int
			)
			INSERT INTO #RegisteredLearners(LearnerId, SubjectsTaken, SubjectsPassed)
			SELECT L.LearnerId, dbo.getLearnerSubjectsCount(@PrevYearTermId,L.LearnerId) [Count],dbo.getLearnerSubjectsPassed(@PrevYearTermId,L.LearnerId)[Passed]
			FROM Learner L
			ORDER BY LearnerId


			DELETE #RegisteredLearners
			WHERE SubjectsPassed IS NULL OR SubjectsTaken = 0
	
			UPDATE #RegisteredLearners
				SET Pass = CASE WHEN SubjectsPassed >= SubjectsTaken - 1 THEN 1
								WHEN (100.0 * SubjectsPassed/SubjectsTaken) < 50 THEN 0 END
			WHERE Pass IS NULL

			UPDATE #RegisteredLearners
				SET Pass = 1
			WHERE LearnerId IN (
								SELECT P.LearnerId
								FROM
								(
									SELECT RL.LearnerId, 
										   SUM(CASE WHEN LSM1.[Percentage] > S.PassPercentage THEN 1 ELSE 0 END) [T1Pass],
										   SUM(CASE WHEN LSM2.[Percentage] > S.PassPercentage THEN 1 ELSE 0 END) [T2Pass],
										   SUM(CASE WHEN LSM3.[Percentage] > S.PassPercentage THEN 1 ELSE 0 END) [T3Pass],
										   SUM(CASE WHEN LSM4.[Percentage] > S.PassPercentage THEN 1 ELSE 0 END) [T4Pass]
									FROM #RegisteredLearners RL
									JOIN LearnerSubject LS ON LS.LearnerId = RL.LearnerId
									JOIN [Subject] S ON S.SubjectId = LS.SubjectId AND S.[Required] = 1
									JOIN LearnerSubjectMark LSM1 ON LSM1.LearnerSubjectId = LS.LearnerSubjectId AND LSM1.YearTermId = @PrevYearTermId - 3
									JOIN LearnerSubjectMark LSM2 ON LSM2.LearnerSubjectId = LS.LearnerSubjectId AND LSM2.YearTermId = @PrevYearTermId - 2
									JOIN LearnerSubjectMark LSM3 ON LSM3.LearnerSubjectId = LS.LearnerSubjectId AND LSM3.YearTermId = @PrevYearTermId - 1
									JOIN LearnerSubjectMark LSM4 ON LSM4.LearnerSubjectId = LS.LearnerSubjectId AND LSM4.YearTermId = @PrevYearTermId 
									WHERE RL.Pass IS NULL --AND LSM.[Percentage] > S.PassPercentage
									GROUP BY RL.LearnerId
								) P -- have at least passed 2 required subjects
								JOIN LearnerSubject LS ON P.LearnerId =LS.LearnerId 
								JOIN LearnerSubjectMark LSM ON LSM.LearnerSubjectId = LS.LearnerSubjectId AND LSM.YearTermId BETWEEN @PrevYearTermId-3 AND @PrevYearTermId
								WHERE P.T1Pass > 2 AND P.T2Pass > 2  AND P.T3Pass > 2 AND P.T4Pass > 2
								GROUP BY P.LearnerId
								HAVING AVG(LSM.[Percentage]) >= 50 --have an overall percentage above 50
								)
			  
			UPDATE #RegisteredLearners
				SET Pass = 0
			WHERE Pass IS NULL
		
			UPDATE #RegisteredLearners
			SET GradeId = B.[Grade]
			FROM
				(
					SELECT RL.LearnerId, MIN(S.GradeId) [Grade]
					FROM  #RegisteredLearners RL
					JOIN LearnerSubject LS ON RL.LearnerId =LS.LearnerId 
					JOIN LearnerSubjectMark LSM ON LSM.LearnerSubjectId = LS.LearnerSubjectId AND LSM.YearTermId = @PrevYearTermId
					JOIN [Subject] S ON S.SubjectId = LS.SubjectId
					GROUP BY RL.LearnerId
				) B
			WHERE 
				#RegisteredLearners.LearnerId = B.LearnerId

			INSERT INTO LearnerSubject(LearnerId, SubjectId, EffectiveFrom, EffectiveTo)
			SELECT B.LearnerId, S.SubjectId, @RunDate, '9999-12-31'
			FROM
				(SELECT RL.LearnerId, CASE WHEN Pass = 1 THEN GradeId + 1 ELSE GradeId END [GradeId]
					FROM #RegisteredLearners RL
					JOIN
						(
							SELECT LearnerId,  MAX(LearnerSchoolId)  AS LearnerSchoolId
							FROM LearnerSchool
							GROUP BY LearnerId
						) A ON A.LearnerId = RL.LearnerId
					JOIN LearnerSchool LS ON LS.LearnerSchoolId = A.LearnerSchoolId AND EffectiveTo > @RunDate
					) B 
			JOIN [Subject] S ON S.GradeId = B.GradeId 
			WHERE B.GradeId < 10	
			
			INSERT INTO LearnerSubject(LearnerId, SubjectId, EffectiveFrom, EffectiveTo)
			SELECT B.LearnerId, S.SubjectId, @RunDate, '9999-12-31'
			FROM
				(SELECT RL.LearnerId, CASE WHEN Pass = 1 AND GradeId = 12 THEN NULL WHEN Pass = 1 THEN SubjectId + 11 ELSE SubjectId END [SubjectId]
					FROM #RegisteredLearners RL
					JOIN
						(
							SELECT LearnerId,  MAX(LearnerSchoolId)  AS LearnerSchoolId
							FROM LearnerSchool
							GROUP BY LearnerId
						) A ON A.LearnerId = RL.LearnerId
					JOIN LearnerSchool LS ON LS.LearnerSchoolId = A.LearnerSchoolId AND EffectiveTo > @RunDate
					JOIN LearnerSubject LSS ON LSS.LearnerId = RL.LearnerId
					) B 
			WHERE B.[SubjectId] IS NOT NULL		
		END
END
GO
