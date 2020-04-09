USE [SchoolSystem]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Get the learner marks per entity
-- Use (Ex) : SELECT * FROM dbo.getEntityLearnerMarks(5, '2018-05-05')
-- =============================================
CREATE FUNCTION [dbo].[getEntityLearnerMarks]
(
	
	@EntityId int,
	@Rundate date= null
)
RETURNS 
@Marks TABLE
(
	CountryId int,
	ProvinceId int,
	SchoolId int,
	LearnerId int, 
	GradeId int,
	AvgMark decimal(8,2)
)
AS
BEGIN
	IF @Rundate IS NULL
		SET @Rundate = GETDATE()
	DECLARE @YearTermId int = (SELECT MAX(YearTermId) FROM YearTerm WHERE @Rundate > [EndDate])
	DECLARE @Term int = (SELECT [Term] FROM YearTerm WHERE YearTermId = @YearTermId)
	
	DECLARE @Schools TABLE
	(
		SchoolId int,
		ProvinceId int,
		CountryId int
	)

	INSERT INTO @Schools
	SELECT * FROM dbo.getSchoolsInEntity(@EntityId)

	IF @Term IN (1,3)
		BEGIN
			INSERT INTO @Marks(SchoolId, ProvinceId, CountryId, LearnerId, AvgMark, GradeId)
			SELECT E.[EntityId], E2.[EntityId], E3.[EntityId], L.LearnerId, AVG(LSM.[Percentage]) [AvgMark], SS.GradeId
			FROM LearnerSubjectMark LSM 
			JOIN LearnerSubject LS ON LSM.LearnerSubjectId = LS.LearnerSubjectId
			JOIN [Subject] SS ON SS.SubjectId = LS.SubjectId
			JOIN Learner L ON L.LearnerId = LS.LearnerId
			JOIN LearnerSchool LS1 ON LS1.LearnerId = L.LearnerId
			JOIN School S ON S.SchoolId = LS1.SchoolId
			JOIN Entity E ON E.EntityId = S.EntityId
			JOIN Entity E2 ON E2.EntityId = E.ParentEntityId
			JOIN Entity E3 ON E3.EntityId = E2.ParentEntityId
			WHERE LSM.YearTermId = @YearTermId
			GROUP BY L.LearnerId, E.[EntityId], E2.[EntityId], E3.[EntityId], SS.GradeId
		END
		IF @Term = 2 
		BEGIN
			INSERT INTO @Marks(SchoolId, ProvinceId, CountryId, LearnerId, AvgMark, GradeId)
			SELECT E.[EntityId], E2.[EntityId], E3.[EntityId], L.LearnerId, AVG(LSM.[Percentage]) [AvgMark], SS.GradeId
			FROM LearnerSubjectMark LSM 
			JOIN LearnerSubject LS ON LSM.LearnerSubjectId = LS.LearnerSubjectId
			JOIN [Subject] SS ON SS.SubjectId = LS.SubjectId
			JOIN Learner L ON L.LearnerId = LS.LearnerId
			JOIN LearnerSchool LS1 ON LS1.LearnerId = L.LearnerId
			JOIN School S ON S.SchoolId = LS1.SchoolId
			JOIN Entity E ON E.EntityId = S.EntityId
			JOIN Entity E2 ON E2.EntityId = E.ParentEntityId
			JOIN Entity E3 ON E3.EntityId = E2.ParentEntityId
			WHERE LSM.YearTermId in (@YearTermId, @YearTermId-1)
			GROUP BY L.LearnerId, E.[EntityId], E2.[EntityId], E3.[EntityId], SS.GradeId
		END
		IF @Term = 4
		BEGIN
			INSERT INTO @Marks(SchoolId, ProvinceId, CountryId, LearnerId, AvgMark, GradeId)
			SELECT E.[EntityId], E2.[EntityId], E3.[EntityId], L.LearnerId, AVG(LSM.[Percentage]) [AvgMark], SS.GradeId
			FROM LearnerSubjectMark LSM 
			JOIN LearnerSubject LS ON LSM.LearnerSubjectId = LS.LearnerSubjectId
			JOIN [Subject] SS ON SS.SubjectId = LS.SubjectId
			JOIN Learner L ON L.LearnerId = LS.LearnerId
			JOIN LearnerSchool LS1 ON LS1.LearnerId = L.LearnerId
			JOIN School S ON S.SchoolId = LS1.SchoolId
			JOIN Entity E ON E.EntityId = S.EntityId
			JOIN Entity E2 ON E2.EntityId = E.ParentEntityId
			JOIN Entity E3 ON E3.EntityId = E2.ParentEntityId
			WHERE LSM.YearTermId in (@YearTermId, @YearTermId-1,@YearTermId-2, @YearTermId-3)
			GROUP BY L.LearnerId, E.[EntityId], E2.[EntityId], E3.[EntityId], SS.GradeId
		END

	RETURN 
END

GO


