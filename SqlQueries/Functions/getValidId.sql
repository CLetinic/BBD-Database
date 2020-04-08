SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Check if Id number is a valid RSA ID number
-- Use (Ex) : SELECT [dbo].[getValidId]('1996-01-01',0, '9611221110088')
-- ====================================================================
CREATE FUNCTION [dbo].[getValidId]
(
	-- Add the parameters for the function here
	@BirthDate date,
	@Gender bit,
	@IdNumber varchar(13)

)
RETURNS bit
AS
BEGIN
	
	DECLARE @isValid bit = 0
	
	DECLARE @ValidBirh bit, @ValidGend bit, @ValidNatio bit

	SELECT @ValidBirh = A.validBirth, @ValidGend = A.validGend, @ValidNatio = A.validNatio
	FROM 
	(
			SELECT CASE WHEN SUBSTRING(@IdNumber, 1, 6) = SUBSTRING(REPLACE(@BirthDate, '-',''), 3, 6) THEN 1 
						ELSE 0 
				   END [validBirth],																--validate birthdate
				   CASE WHEN SUBSTRING(@IdNumber, 7, 1) BETWEEN 0 AND 4 AND @Gender = 0 THEN 1 
						WHEN SUBSTRING(@IdNumber, 7, 1) BETWEEN 5 AND 9 AND @Gender = 1 THEN 1
						ELSE 0 
				   END [validGend],																				--validate gender
				   CASE WHEN SUBSTRING(@IdNumber, 11, 1) BETWEEN 0 AND 1 THEN 1
						ELSE 0
				   END	[validNatio]																	--validate nationality
	) A
	
	
	IF  @ValidBirh = 1 AND @ValidGend = 1 AND @ValidNatio = 1
	BEGIN
		SET @isValid = dbo.[checkSum](@Idnumber)
	END
	--check length before
	

	-- Return the result of the function
	RETURN @isValid

END
GO

