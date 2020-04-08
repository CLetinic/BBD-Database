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
-- EXAMPLE EXEC InsertAbsentEducator '2018-01-01', 1
-- =============================================
CREATE PROCEDURE InsertAbsentEducator
	-- Add the parameters for the stored procedure here
	@Rundate date null,
	@EducatorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Rundate IS NULL
		BEGIN
			SET @Rundate = GETDATE()
		END
	DECLARE @YearTermId int = (SELECT MAX(YearTermId) FROM YearTerm WHERE @Rundate BETWEEN StartDate AND EndDate)

	--check if weekday or public holiday or not in term
	
	IF DATEPART(WEEKDAY, @Rundate) NOT IN  (6,7) AND (SELECT [dbo].[getPublicHolidays](@Rundate, @Rundate)) < 1 AND (@YearTermId IS NOT NULL)
		BEGIN

			INSERT INTO EducatorAbsent(EducatorId,[Date])
			VALUES (@EducatorId, @Rundate)
		END
	
END
GO


