SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<van Zyl,,S>
-- Create date: <2020-04-05>
-- Description:	<Insert a learner into the learner table>
-- Example: EXEC [InsertEducator] 'Susan','van Zyl',2,'1996-11-22','9611221110088', 1, '2018-01-01'
-- =============================================
CREATE PROCEDURE dbo.[InsertEducator] 
	@FirstName varchar(100),
	@LastName varchar(100),
	@GenderId int,
	@BirthDate date,
	@IdNumber varchar(13),
	@SchoolId int,
	@EffectiveFrom date = null
AS
BEGIN

	SET NOCOUNT ON;

	IF @EffectiveFrom IS NULL
	BEGIN
		SET @EffectiveFrom = GETDATE()
	END

	INSERT INTO [dbo].[Educator] ([FirstName],[LastName],[IDNumber],[BirthDate],[GenderId])
	VALUES (@FirstName,@LastName, @IdNumber, @BirthDate, @GenderId)

	DECLARE @EducatorId int = @@Identity;

	INSERT INTO EducatorSchool(EducatorId, SchoolId, EffectiveFrom, EffectiveTo)
	VALUES (@EducatorId,@SchoolId,@EffectiveFrom,'9999-12-31')

END
GO
