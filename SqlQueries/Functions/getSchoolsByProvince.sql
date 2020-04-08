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
-- Description:	Get Schools by input Province
-- =============================================
CREATE FUNCTION dbo.getSchoolsByProvince
(	
	@province VARCHAR(55)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		School.SchoolId, 	
		SchoolType.Description AS SchoolType,
		Entity.Name AS SchoolName,
		provEnt.ProvinceName AS Province
	FROM School
	RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
	RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId
	JOIN (SELECT
			child.EntityId AS SchoolEntID,
			parent.Name AS ProvinceName
		FROM Entity child
		INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId) AS provEnt ON School.EntityId=provEnt.SchoolEntID
	WHERE provEnt.ProvinceName=@province
)
GO

-- =============================================
-- TEST
-- =============================================
--SELECT * FROM dbo.getSchoolsByProvince('Free State')
--GO