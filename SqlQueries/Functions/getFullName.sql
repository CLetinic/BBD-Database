-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	Get Full Name
-- =============================================
CREATE FUNCTION dbo.getFullName
(
	-- Add the parameters for the function here
	@FirstName VARCHAR(100),
	@LastNameVARCHAR(100)
)
RETURNS VARCHAR(202)
AS
BEGIN
	RETURN (SELECT  @FirstName + SPACE(1) + @LastName )
END
GO

-- =============================================
-- TEST
-- =============================================
--SELECT *,
--dbo.getFullName(Learner.FirstName, Learner.LastName) AS STUDENTNAME
--FROM
--[dbo].Learner
--GO