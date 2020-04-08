-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
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
