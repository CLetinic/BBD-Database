SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Get the number of schooldays between two dates
-- Use (Ex) : SELECT * FROM [dbo].[getSchoolsInEntity](10)
-- ====================================================================
CREATE FUNCTION dbo.[getSchoolsInEntity]
(
	@EntityId int
)
RETURNS 
@Schools TABLE
(
	Schoolid int,
	ProvinceId int,
	CountryId int
)
AS
BEGIN

	DECLARE @Entities TABLE
	(
		ProvinceId int,
		CountryId int
	)

	DECLARE @EntityTypeId int = (SELECT  E.EntityTypeId FROM Entity E WHere E.EntityId = @EntityId)
	IF @EntityTypeId = 1 --countr
		BEGIN
			INSERT INTO @Entities
			SELECT E.EntityId, @EntityId FROM Entity E WHERE E.ParentEntityId = @EntityId
		END
	IF @EntityTypeId = 2
		BEGIN
			INSERT INTO @Entities 
			SELECT @EntityId, E.ParentEntityId  FROM Entity E WHERE E.EntityId = @EntityId
		END
	IF @EntityTypeId = 3
		BEGIN
			INSERT INTO @Schools
			SELECT S.SchoolId,E.ParentEntityId, E2.EntityId
			FROM Entity E
			JOIN School S ON S.EntityId = E.EntityId
			JOIN Entity E2 ON E2.EntityId = E.ParentEntityId
			WHERE E.EntityId = @EntityId
		END
	INSERT INTO @Schools
	SELECT S.SchoolId , ET.ProvinceId, ET.CountryId
	FROM School S 
	JOIN Entity E ON S.EntityId = E.EntityId
	JOIN @Entities ET ON ET.ProvinceId = E.ParentEntityId
	
			
	RETURN 
END
GO

