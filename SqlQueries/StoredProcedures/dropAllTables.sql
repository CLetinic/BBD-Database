-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dropAllTables

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DROP TABLE EducatorSchool;
	DROP TABLE LearnerSchool;
	DROP TABLE School;
	DROP TABLE Entity;
	DROP TABLE EntityType;
	DROP TABLE EducatorAbsent;
	DROP TABLE Reason;
	DROP TABLE EducatorSubject;
	DROP TABLE LearnerAbsent;
	DROP TABLE Educator;
	DROP TABLE LearnerSubjectMark;
	DROP TABLE LearnerSubject;
	DROP TABLE Learner;
	DROP TABLE Gender;
	DROP TABLE [Subject];
	DROP TABLE YearTerm;
	DROP TABLE SchoolType;
	DROP TABLE Grade;

END
GO
