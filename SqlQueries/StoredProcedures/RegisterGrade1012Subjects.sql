SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Register Grade 10 to 12 Learner Subjects
-- Use (Ex) : EXEC RegisterGrade1012Subjects 1,128,137,145,142,127,135,143, '2018-01-01'

-- ====================================================================
CREATE PROCEDURE RegisterGrade1012Subjects
	-- Add the parameters for the stored procedure here
	@LearnerId int,
	@Lang1 int,
	@Lang2 int,
	@Maths int,
	@LO int, 
	@Elec1 int,
	@Elec2 int,
	@Elec3 int,
	@RunDate date = null
AS
BEGIN
	SET NOCOUNT ON;

	IF @RunDate IS NULL
		SET @RunDate = GETDATE()
	DECLARE @YearTermId int = (SELECT Max(YearTermId) FROM YearTerm WHERE @RunDate BETWEEN StartDate AND EndDate)
	IF @YearTermId IS NULL
	BEGIN
		SELECT @YearTermId = MAX(YearTermId)+ 1 FROM YearTerm WHERE  @RunDate > EndDate
	END
	
	DECLARE @EffectiveFrom date = (SELECT StartDate FROM YearTerm WHERE YearTermId = @YearTermId)
    INSERT INTO LearnerSubject(LearnerId, SubjectId, EffectiveFrom, EffectiveTo)
	VALUES	(@LearnerId, @Lang1, @EffectiveFrom,'9999-12-31'),
			(@LearnerId, @Lang2, @EffectiveFrom,'9999-12-31'),
			(@LearnerId, @Maths, @EffectiveFrom,'9999-12-31'),
			(@LearnerId, @LO,	 @EffectiveFrom,'9999-12-31'),
			(@LearnerId, @Elec1, @EffectiveFrom,'9999-12-31'),
			(@LearnerId, @Elec2, @EffectiveFrom,'9999-12-31'),
			(@LearnerId, @Elec3, @EffectiveFrom,'9999-12-31')
END
GO
