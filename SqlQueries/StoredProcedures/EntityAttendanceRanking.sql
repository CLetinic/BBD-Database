SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Get the schools who do not have educators registered 
--              for all subjects
-- Use (Ex) : EXEC EntityAttendanceRanking '2018-01-01', '2018-08-31', 2
-- ====================================================================
CREATE PROCEDURE EntityAttendanceRanking
(
	@StartDate date,
	@EndDate date,
	@EntityId int
)
AS
BEGIN
	DECLARE @EntityTypeId int = (SELECT E.EntityTypeId FROM Entity E WHERE E.EntityId = @EntityId)
	
	DECLARE @Attendance TABLE
	(
		CountryId int,
		ProvinceId int,
		SchoolId int,
		Attendance decimal(8,2)
	)

	DECLARE @Result TABLE
	(
		Entity varchar(100),
		AvgAttendance decimal(8,2)
	)

	INSERT INTO @Attendance
	SELECT CountryId, ProvinceId, SchoolId, Attendance  FROM dbo.getEntityLearnerAttendance(@StartDate, @EndDate, @EntityId)


	IF(@EntityTypeId = 1)
	BEGIN
	INSERT INTO @Result
		SELECT E2.[Name] [Entity],  AVG(A.Attendance) [AvgAttendance]
		FROM @Attendance A
		JOIN Entity E1 ON E1.EntityId = A.CountryId
		JOIN Entity E2 ON E2.EntityId = A.ProvinceId
		WHERE E1.EntityId = @EntityId
		GROUP BY [CountryId], [ProvinceId], E2.[Name] 
	END
	IF(@EntityTypeId = 2)
	BEGIN
		INSERT INTO @Result
		SELECT E2.[Name] [Entity],  AVG(A.Attendance) [AvgAttendance]
		FROM @Attendance A
		JOIN Entity E1 ON E1.EntityId = A.ProvinceId
		JOIN School S ON S.SchoolId = A.SchoolId
		JOIN Entity E2 ON E2.EntityId = S.EntityId
		WHERE E1.EntityId = @EntityId
		GROUP BY [ProvinceId], S.SchoolId, E2.[Name] 
	END

	SELECT RANK() OVER (ORDER BY [AvgAttendance] DESC) [Pos] ,[Entity], [AvgAttendance]
	FROM @Result 
END
GO
