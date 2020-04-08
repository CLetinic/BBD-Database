SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Meluleki Dube>
-- Create date: <2020-04-08>
-- Description:	<Updates marks of a particular learner for a particular subject on a particular year term with a particular percentage>
-- Example: EXEC
-- =============================================
CREATE PROCEDURE dbo.[updateUserGrade] @learnerId int,
                                       @subjectId int,
                                       @yearTermId int,
                                       @percentage int
AS
BEGIN
    DECLARE
        @learnerSubjectId int;
    BEGIN TRANSACTION updateMarks;
    BEGIN TRY
        -- WE WANT TO UPDATE BOTH THE SUBJECT MARK, GRADE AND THEN ALSO UPDATE THE LEARNER SUBJECT MARK
        -- UPDATE THE PERCENTAGE FOR THE LEARNER
        SET @learnerSubjectId =
                (SELECT LearnerSubjectId FROM LearnerSubject WHERE LearnerId = @learnerId AND SubjectId = @subjectId);
        DECLARE
            @prevMark INT = (SELECT Percentage
                             FROM LearnerSubjectMark
                             WHERE LearnerSubjectId = @learnerSubjectId
                               AND YearTermId = @yearTermId);
        UPDATE LearnerSubjectMark
        SET Percentage = @percentage
        WHERE LearnerSubjectId = @learnerSubjectId
          AND YearTermId = @yearTermId

        IF (@prevMark >= 50 AND @percentage < 50) OR (@prevMark < 50 AND @percentage >= 50)
            BEGIN
                DECLARE
                    @numLearners int = (SELECT COUNT(*) FROM LearnerSubject WHERE SubjectId = @subjectId);
                DECLARE
                    @numLearnersPassed int = (SELECT COUNT(*)
                                              FROM LearnerSubjectMark
                                              WHERE @learnerSubjectId IN
                                                    (SELECT LearnerSubjectId
                                                     FROM LearnerSubject
                                                     WHERE SubjectId = @subjectId)
                                                AND Percentage >= 49);
                UPDATE Subject SET PassPercentage = ((@numLearnersPassed / @numLearners)) WHERE SubjectId = @subjectId
            END
        -- now we update the subject pass rate
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK
    end catch
end
GO
