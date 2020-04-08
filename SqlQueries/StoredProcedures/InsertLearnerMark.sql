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
-- EXEC InsertLearnerMark 1 , 80 , '2018-03-27'
-- =============================================
CREATE PROCEDURE InsertLearnerMark 
	-- Add the parameters for the stored procedure here
	@LearnerSubjectId int,
	@Percentage decimal(8,2),
	@Rundate date null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	DECLARE @YearTermId int

	IF @Rundate IS NULL
		BEGIN
			SET @Rundate = GETDATE()
		END

	SELECT @YearTermId = MAX(YearTermId) FROM YearTerm WHERE @Rundate BETWEEN StartDate AND EndDate

	IF @YearTermId IS NOT NULL
		BEGIN
			
			INSERT INTO LearnerSubjectMark([LearnerSubjectId], [Percentage],[YearTermId])
			VALUES ( @LearnerSubjectId, @Percentage, @YearTermId) 

			IF (SELECT Term FROM YearTerm WHERE YearTermId = @YearTermId) = 4
			BEGIN
				UPDATE LS
					SET EffectiveTo = @Rundate
				FROM LearnerSubject LS
				WHERE LS.LearnerSubjectId = @LearnerSubjectId
			END
		END
END
GO
