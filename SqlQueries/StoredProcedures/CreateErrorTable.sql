SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Table to record errors
CREATE TABLE [DB_Errors]
(ErrorID        INT IDENTITY(1, 1),
 UserName       VARCHAR(100),
 ErrorNumber    INT,
 ErrorState     INT,
 ErrorSeverity  INT,
 ErrorLine      INT,
 ErrorProcedure VARCHAR(MAX),
 ErrorMessage   VARCHAR(MAX),
 ErrorDateTime  DATETIME)
GO