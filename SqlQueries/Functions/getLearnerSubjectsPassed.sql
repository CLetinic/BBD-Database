SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION dbo.getLearnerSubjectsPassed
(
	@YearTermId int,
	@LearnerId int
)
RETURNS int
AS
BEGIN
		DECLARE @PassCount int
		SELECT @PassCount =  SUM( CASE WHEN LSM.[Percentage]>= S.PassPercentage THEN 1 ELSE 0 END) 
		FROM LearnerSubjectMark LSM
		JOIN LearnerSubject LS ON LS.LearnerSubjectId = LSM.LearnerSubjectId
		JOIN [Subject] S ON S.SubjectId = LS.SubjectId
		WHERE  LSM.YearTermId = @YearTermId AND LS.LearnerId = @LearnerId

		RETURN @PassCount
END
GO

