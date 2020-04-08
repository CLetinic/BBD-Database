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
    -- inspect what we have before the transaction
    SELECT *
    FROM LearnerSubjectMark
    WHERE LearnerSubjectId =
          (SELECT LearnerSubjectId FROM LearnerSubject WHERE SubjectId = @subjectId AND LearnerId = @learnerId);

    BEGIN TRANSACTION updateMarks;
    BEGIN TRY
        -- WE WANT TO UPDATE BOTH THE SUBJECT MARK, GRADE AND THEN ALSO UPDATE THE LEARNER SUBJECT MARK
        -- UPDATE THE PERCENTAGE FOR THE LEARNER
        DECLARE
            @learnerSubjectId int = (SELECT LearnerSubjectId
                                     FROM LearnerSubject
                                     WHERE LearnerId = @learnerId
                                       AND SubjectId = @subjectId);
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
                    @numLearners int = (SELECT COUNT(*)
                                        FROM LearnerSubjectMark
                                        WHERE LearnerSubjectId IN (SELECT LearnerSubjectId
                                                                   from LearnerSubject
                                                                   WHERE SubjectId = @subjectId));
                DECLARE
                    @numLearnersPassed int = (SELECT COUNT(*)
                                              FROM LearnerSubjectMark
                                              WHERE @learnerSubjectId IN
                                                    (SELECT LearnerSubjectId
                                                     FROM LearnerSubject
                                                     WHERE SubjectId = @subjectId)
                                                AND Percentage >= 50);
                -- now we update the subject pass rate
                UPDATE Subject SET PassPercentage = ((@numLearnersPassed / @numLearners)) WHERE SubjectId = @subjectId
            END
        -- inspect the changes resulting from above changes
        SELECT *
        FROM LearnerSubjectMark
        WHERE LearnerSubjectId =
              (SELECT LearnerSubjectId FROM LearnerSubject WHERE SubjectId = @subjectId AND LearnerId = @learnerId);

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK
    end catch

    -- inspect what we have now after the transaction
    SELECT *
    FROM LearnerSubjectMark
    WHERE LearnerSubjectId =
          (SELECT LearnerSubjectId FROM LearnerSubject WHERE SubjectId = @subjectId AND LearnerId = @learnerId);

end
GO