SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Susan van Zyl
-- Create date: 2020-04-08
-- Description:	Check Sum Digit LUHN ALGORITHM (RSA Id number)
-- Use (Ex) : SELECT [dbo].[checkSum]('6404020030084')
-- ====================================================================
CREATE FUNCTION [dbo].[checkSum]
(
	@IdNumber varchar(13)
)
RETURNS bit
AS
BEGIN
	DECLARE @isValid bit
	DECLARE @Result int = 0, @rem int = 0, @odd int = 0,
	@i int = 12, @even int = 0, @total int

		WHILE @i > 0
		BEGIN
			IF (@i % 2) = 0
			BEGIN
				SELECT @even = @even + @rem + ((CONVERT(int, SUBSTRING(@IdNumber, @i, 1)) * 2) % 10)
				SELECT @rem = (CONVERT(int, SUBSTRING(@IdNumber, @i, 1)) * 2) / 10
			END 
			ELSE
				SELECT @odd = @odd + CONVERT(int, SUBSTRING(@IdNumber, @i, 1))
				SELECT @i = @i - 1
			END
			SELECT @total = 10 - ((@even + @odd + @rem) % 10)
			SELECT @Result = CASE WHEN LEN(@total) > 1 THEN SUBSTRING(CONVERT(VARCHAR,@total), LEN(@total), 1) ELSE @total END
		

		 
	IF @Result = SUBSTRING(@IdNumber,LEN(@IdNumber),1)
		RETURN 1

	RETURN 0
END
GO

