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
-- =====================================================================
-- Description:	Returns the average marks for a school's grade subject
-- =====================================================================
CREATE FUNCTION dbo.getSchoolsGradeSubjectAverage 
(	
	-- Add the parameters for the function here
	@school VARCHAR(55), 
	@grade int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT DISTINCT
			Subject.Description AS Subject,
			Subject.GradeId AS Grade,
			(SELECT CAST(AVG(Percentage) AS DECIMAL(10,2))
			FROM LearnerSubjectMark 
			WHERE LearnerSubjectMark.LearnerSubjectId=LearnerSubject.SubjectId AND Entity.Name=@school AND Subject.GradeId=@grade) AS AveragePercentageMarkForSubject,
			Entity.Name AS SchoolName,
			provEnt.ProvinceName AS Province
	FROM Subject
	JOIN LearnerSubject ON Subject.SubjectId=LearnerSubject.SubjectId
	JOIN LearnerSubjectMark ON LearnerSubject.LearnerSubjectId=LearnerSubjectMark.LearnerSubjectId
	JOIN LearnerSchool ON LearnerSubject.LearnerId=LearnerSchool.LearnerId
	JOIN School ON LearnerSchool.SchoolId=School.SchoolId
	JOIN Entity ON School.EntityId=Entity.EntityId
	JOIN (SELECT
			child.EntityId AS SchoolEntID,
			parent.Name AS ProvinceName
		FROM Entity child
		INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId) AS provEnt ON School.EntityId=provEnt.SchoolEntID
	WHERE Entity.Name=@school AND Subject.GradeId=@grade
)
GO

-- =============================================
-- TEST
-- =============================================
--SELECT * FROM getSchoolsGradeSubjectAverage ('HOËRSKOOL PIET RETIEF', 6)
--GO