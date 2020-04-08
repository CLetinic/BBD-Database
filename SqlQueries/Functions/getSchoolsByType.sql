-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION dbo.getSchoolsByType
(	
	-- Add the parameters for the function here
	@SchoolTypeId int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		SchoolType.SchoolTypeId AS SchoolTypeID,
		SchoolType.Description AS SchoolType,
		School.SchoolId, 
		Entity.Name AS SchoolName		
	FROM School
	RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
	RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId
	WHERE SchoolType.SchoolTypeId=@SchoolTypeId
)
GO

-- =============================================
-- TEST
-- =============================================
--SELECT * FROM dbo.getSchoolsByType (2)
--GO

-- =============================================
-- getSchoolsByType by school name
-- =============================================
--CREATE FUNCTION dbo.getSchoolsByType
--(	
--	-- Add the parameters for the function here
--	@type VARCHAR(55)
--)
--RETURNS TABLE 
--AS
--RETURN 
--(
--	-- Add the SELECT statement with parameter references here
--	SELECT 
--		School.SchoolId, 	
--		SchoolType.Description AS SchoolType,
--		Entity.Name AS SchoolName
--	FROM School
--	RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
--	RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId
--	WHERE SchoolType.Description=@type
--)
--GO
