SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Get the schools who do not have educators registered 
--              for all subjects
-- Use (Ex) : EXEC EntityMarksRanking 1, '2018-05-01'
-- ====================================================================
CREATE PROCEDURE EntityMarksRanking
(
	
	@EntityId int,
	@Rundate date = null
)
AS
BEGIN
	DECLARE @EntityTypeId int = (SELECT E.EntityTypeId FROM Entity E WHERE E.EntityId = @EntityId)
	
	DECLARE @Marks TABLE
	(
		CountryId int,
		ProvinceId int,
		SchoolId int,
		LearnerId int, 
		GradeId int,
		AvgMark decimal(8,2)
	)

	DECLARE @Result TABLE
	(
		Entity varchar(100),
		[AvgMark] decimal(8,2)
	)

	INSERT INTO @Marks
	SELECT *  FROM dbo.[getEntityLearnerMarks](@EntityId, @Rundate)


	IF(@EntityTypeId = 1)
	BEGIN
	INSERT INTO @Result
		SELECT E2.[Name] [Entity],  AVG(M.AvgMark) [AvgMark]
		FROM @Marks M
		JOIN Entity E1 ON E1.EntityId = M.CountryId
		JOIN Entity E2 ON E2.EntityId = M.ProvinceId
		WHERE E1.EntityId = @EntityId
		GROUP BY [CountryId], [ProvinceId], E2.[Name] 
	END
	IF(@EntityTypeId = 2)
	BEGIN
		INSERT INTO @Result
		SELECT E2.[Name] [Entity],  AVG(M.AvgMark) [AvgMark]
		FROM @Marks M
		JOIN Entity E1 ON E1.EntityId = M.ProvinceId
		JOIN School S ON S.SchoolId = M.SchoolId
		JOIN Entity E2 ON E2.EntityId = S.EntityId
		WHERE E1.EntityId = @EntityId
		GROUP BY [ProvinceId], S.SchoolId, E2.[Name] 
	END

	SELECT RANK() OVER (ORDER BY [AvgMark] DESC) [Pos] ,[Entity], [AvgMark]
	FROM @Result 
END
GO
