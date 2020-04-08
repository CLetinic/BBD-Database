USE SchoolSystem;
GO

CREATE PROCEDURE dbo.[spSelectEducator]
    @EducatorId int
AS
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    SELECT EducatorId, FirstName, LastName, IDNumber, BirthDate, GenderId 
    FROM   dbo.[Educator]
    WHERE  [EducatorId] = @EducatorId
    COMMIT
GO

CREATE PROCEDURE [dbo].[spInsertEducator] 
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

CREATE PROCEDURE dbo.[spUpdateEducator]
	@EducatorId int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@IDNumber varchar(13),
	@BirthDate date,
	@GenderId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    UPDATE dbo.[Educator]
    SET    [FirstName] = @FirstName, [LastName] = @LastName, [IDNumber] = @IDNumber, [BirthDate] = @BirthDate, 
           [GenderId] = @GenderId
    WHERE  [EducatorId] = @EducatorId
    COMMIT
GO

CREATE PROCEDURE dbo.[spDeleteEducator]
	@EducatorId int
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRANSACTION

    DELETE
    FROM   dbo.[Educator]
    WHERE  [EducatorId] = @EducatorId

    COMMIT
GO