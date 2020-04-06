SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<van Zyl,,S>
-- Create date: <2020-04-05>
-- Description:	<Insert a School into the School, Entity table>
-- Example: EXEC [InsertSchool] 'Hoerskool Hoopstad', 7, 2
-- =============================================
CREATE PROCEDURE dbo.[InsertSchool]
	@EntityName varchar(100),
	@ParentEntityId int,
	@SchoolTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Entity]([Name], [EntityTypeId], [ParentEntityId])
	VALUES (@EntityName,3,@ParentEntityId)

	DECLARE @EntityId int = @@Identity;

	INSERT INTO School([EntityId],[SchoolTypeId])
	VALUES(@EntityId, @SchoolTypeId)
END
GO
