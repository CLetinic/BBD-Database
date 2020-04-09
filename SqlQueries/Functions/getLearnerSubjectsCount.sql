SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION dbo.getLearnerSubjectsCount
(
	@YearTermId int,
	@LearnerId int
)
RETURNS int
AS
BEGIN

		DECLARE @Count int
		SELECT @Count =  COUNT(LSM.LearnerSubjectMarkId) 
		FROM LearnerSubjectMark LSM 
		LEFT OUTER JOIN  LearnerSubject LS ON LS.LearnerSubjectId = LSM.LearnerSubjectId
		JOIN [Subject] S ON S.SubjectId = LS.SubjectId
		WHERE  LSM.YearTermId = @YearTermId AND LS.LearnerId = @LearnerId

		RETURN @Count
END
GO

