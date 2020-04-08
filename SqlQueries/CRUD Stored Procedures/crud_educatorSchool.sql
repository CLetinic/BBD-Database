USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectEducatorSchool]
    @EducatorSchoolId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT [EducatorSchoolId], [EducatorId], [SchoolId], [EffectiveFrom], [EffectiveTo]
    FROM   dbo.[EducatorSchool]
    WHERE  [EducatorSchoolId] = @EducatorSchoolId  

    COMMIT
GO

CREATE PROCEDURE dbo.[spInsertEducatorSchool] 
    @EducatorSchoolId int,
    @EducatorId int,
    @SchoolId int,
    @EffectiveFrom date,
    @EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    INSERT INTO dbo.[EducatorSchool] ([EducatorSchoolId], [EducatorId], [SchoolId], [EffectiveFrom], [EffectiveTo])
    SELECT @EducatorSchoolId, @EducatorId, @SchoolId, @EffectiveFrom, @EffectiveTo
    COMMIT
GO

CREATE PROCEDURE dbo.[spUpdateEducatorSchool]
	@EducatorSchoolId int,
	@EducatorId int,
	@SchoolId int,
	@EffectiveFrom date,
	@EffectiveTo date
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[EducatorSchool]
    SET    [EducatorId] = @EducatorId, [SchoolId] = @SchoolId, [EffectiveFrom] = @EffectiveFrom, [EffectiveTo] = @EffectiveTo
    WHERE  [EducatorSchoolId] = @EducatorSchoolId

    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteEducatorSchool] 
	@EducatorSchoolId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[EducatorSchool]
    WHERE  [EducatorSchoolId] = @EducatorSchoolId

    COMMIT
GO