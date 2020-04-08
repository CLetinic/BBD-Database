SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Get the schools who do not have educators registered 
--              for all subjects
-- Use (Ex) : EXEC SchoolsWithMissingSubjects
-- ====================================================================
CREATE PROCEDURE SchoolsWithMissingSubjects
AS
BEGIN
	SELECT A.SchoolId, COUNT(A.SubjectId)--, A.GradeId 
	FROM EducatorSchool ES 
	JOIN EducatorSubject ESS ON ESS.EducatorId = ES.EducatorId
	RIGHT OUTER JOIN 
		(	SELECT S.SchoolId, SS.SubjectId, SS.GradeId
			FROM School S 
			JOIN SchoolType ST ON ST.SchoolTypeId = S.SchoolTypeId
			CROSS JOIN [Subject] SS 
			WHERE SS.GradeId BETWEEN ST.MinGradeId AND ST.MaxGradeId
		) A ON A.SchoolId = ES.SchoolId AND ESS.SubjectID = A.SubjectId
	WHERE ES.EducatorSchoolId IS NULL
	GROUP BY A.SchoolId
END
GO
