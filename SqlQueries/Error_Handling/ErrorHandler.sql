-- Verify that the stored procedure does not already exist.
IF OBJECT_ID('usp_GetErrorInfo', 'P') IS NOT NULL
    DROP PROCEDURE usp_GetErrorInfo;
GO

-- Create procedure to retrieve error information.
CREATE PROCEDURE usp_GetErrorInfo
AS

INSERT INTO dbo.DB_Errors
VALUES (SUSER_SNAME(),
        ERROR_NUMBER(),
        ERROR_STATE(),
        ERROR_SEVERITY(),
        ERROR_LINE(),
        ERROR_PROCEDURE(),
        ERROR_MESSAGE(),
        GETDATE());

SELECT ERROR_NUMBER()    AS ErrorNumber
     , ERROR_PROCEDURE() AS ErrorProcedure
     , ERROR_LINE()      AS ErrorLine
     , ERROR_MESSAGE()   AS ErrorMessage;

GO
