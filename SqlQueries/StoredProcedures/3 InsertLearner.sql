SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<van Zyl,,S>
-- Create date: <2020-04-05>
-- Description:	<Insert a learner into the learner table>
-- Example: EXEC InsertLearner 'Susan','van Zyl',2,'1996-11-22','9611221110088', 1,12, '2018-01-01'
-- =============================================
CREATE PROCEDURE dbo.[InsertLearner] 
	@FirstName varchar(100),
	@LastName varchar(100),
	@GenderId int,
	@BirthDate date,
	@IdNumber varchar(13),
	@SchoolId int,
	@GradeId int,
	@EffectiveFrom date = null
AS
BEGIN

	SET NOCOUNT ON;

	IF @EffectiveFrom IS NULL
	BEGIN
		SET @EffectiveFrom = GETDATE()
	END

	INSERT INTO [dbo].[Learner] ([FirstName],[LastName],[IDNumber],[BirthDate],[GenderId])
	VALUES (@FirstName,@LastName, @IdNumber, @BirthDate, @GenderId)

	DECLARE @LearnerId int = @@Identity;

	INSERT INTO LearnerSchool(LearnerId, SchoolId, EffectiveFrom, EffectiveTo)
	VALUES (@LearnerId,@SchoolId,@EffectiveFrom,'9999-12-31')

	IF(@GradeId<7)
	BEGIN
		INSERT INTO LearnerSubject(LearnerId, SubjectId, EffectiveFrom, EffectiveTo)
		--VALUES (@LearnerId,@SchoolId,GETDATE(),'9999-12-31')
		SELECT @LearnerId, S.SubjectId, GETDATE(), '9999-12-31'
		FROM getGradeSubjects(@GradeId) S
	END
END
GO
