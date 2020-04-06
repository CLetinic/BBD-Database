SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<van Zyl,,S>
-- Create date: <2020-04-05>
-- Description:	<Insert a learner into the learner table>
-- Example: EXEC InsertLearner 'Susan','van Zyl',2,'1996-11-22','9611221110088', 1, '2018-01-01'
-- =============================================
ALTER PROCEDURE dbo.[InsertLearner] 
	@FirstName varchar(100),
	@LastName varchar(100),
	@GenderId int,
	@BirthDate date,
	@IdNumber varchar(13),
	@SchoolId int,
	@EffectiveFrom date = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @EffectiveFrom IS NULL
	BEGIN
		SET @EffectiveFrom = GETDATE()
	END

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Learner] ([FirstName],[LastName],[IDNumber],[BirthDate],[GenderId])
	VALUES (@FirstName,@LastName, @IdNumber, @BirthDate, @GenderId)

	DECLARE @LearnerId int = @@Identity;

	INSERT INTO LearnerSchool(LearnerId, SchoolId, EffectiveFrom, EffectiveTo)
	VALUES (@LearnerId,@SchoolId,@EffectiveFrom,'9999-12-31')
END
GO
