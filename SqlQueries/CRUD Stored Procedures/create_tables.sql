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
ALTER PROCEDURE createAllTables

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		CREATE TABLE [Grade] (
		  [GradeId] int NOT NULL IDENTITY,
		  [Description] varchar(55),
		  PRIMARY KEY ([GradeId])
		);

		CREATE TABLE [YearTerm] (
		  [YearTermId] int NOT NULL IDENTITY,
		  [Year] int,
		  [Term] int,
		  [StartDate] date,
		  [EndDate] date,
		  PRIMARY KEY ([YearTermId])
		);

		CREATE TABLE [Reason] (
		  [ReasonId] int NOT NULL IDENTITY,
		  [Description] varchar(55),
		  PRIMARY KEY ([ReasonId])
		);

		CREATE TABLE [Subject] (
		  [SubjectId] int NOT NULL IDENTITY,
		  [GradeId] int,
		  [Description] varchar(55),
		  [Required] bit,
		  [PassPercentage] decimal(8,2),
		  PRIMARY KEY ([SubjectId]),
		  FOREIGN KEY ([GradeId]) REFERENCES Grade([GradeId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);


		CREATE TABLE [Gender] (
		  [GenderId] int NOT NULL IDENTITY,
		  [Description] varchar(55),
		  PRIMARY KEY ([GenderId])
		);

		CREATE TABLE [EntityType] (
		  [EntityTypeId] int NOT NULL IDENTITY,
		  [Description] varchar(55),
		  PRIMARY KEY ([EntityTypeId])
		);


		CREATE TABLE [Entity] (
		  [EntityId] int NOT NULL IDENTITY,
		  [Name] varchar(55),
		  [EntityTypeId] int,
		  [ParentEntityId] int,
		  PRIMARY KEY ([EntityId]),
		  FOREIGN KEY ([ParentEntityId]) REFERENCES Entity([EntityId]),
		  FOREIGN KEY ([EntityTypeId]) REFERENCES EntityType([EntityTypeId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [SchoolType] (
		  [SchoolTypeId] int NOT NULL IDENTITY,
		  [Description] varchar(55),
		  [MinGradeId] int,
		  [MaxGradeId] int,
		  PRIMARY KEY ([SchoolTypeId]),
		  FOREIGN KEY ([MinGradeId]) REFERENCES Grade([GradeId]),
		  FOREIGN KEY ([MaxGradeId]) REFERENCES Grade([GradeId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [School] (
		  [SchoolId] int NOT NULL IDENTITY,
		  [EntityId] int,
		  [SchoolTypeId] int,
		  PRIMARY KEY ([SchoolId]),
		  FOREIGN KEY ([EntityId]) REFERENCES Entity([EntityId]),
		  FOREIGN KEY ([SchoolTypeId]) REFERENCES [SchoolType]([SchoolTypeId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [Educator] (
		  [EducatorId] int NOT NULL IDENTITY,
		  [FirstName] varchar(100),
		  [LastName] varchar(100),
		  [IDNumber] varchar(13),
		  [BirthDate] date,
		  [GenderId] int,
		  PRIMARY KEY ([EducatorId]),
		  FOREIGN KEY ([GenderId]) REFERENCES Gender([GenderId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [Learner] (
		  [LearnerId] int NOT NULL IDENTITY,
		  [FirstName] varchar(100),
		  [LastName] varchar(100),
		  [IDNumber] varchar(13),
		  [BirthDate] date,
		  [GenderId] int,
		  PRIMARY KEY ([LearnerId]),
		  FOREIGN KEY ([GenderId]) REFERENCES Gender([GenderId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [LearnerSchool] (
		  [LearnerSchoolId]  int NOT NULL IDENTITY,
		  [LearnerId] int,
		  [SchoolId] int,
		  [EffectiveFrom] date,
		  [EffectiveTo] date,
		  PRIMARY KEY ([LearnerSchoolId]),
		  FOREIGN KEY ([LearnerId]) REFERENCES Learner([LearnerId]),
		  FOREIGN KEY ([SchoolId]) REFERENCES School([SchoolId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);


		CREATE TABLE [EducatorSchool] (
		  [EducatorSchoolId]  int NOT NULL IDENTITY,
		  [EducatorId] int,
		  [SchoolId] int,
		  [EffectiveFrom] date,
		  [EffectiveTo] date,
		  PRIMARY KEY ([EducatorSchoolId]),
		  FOREIGN KEY ([EducatorId]) REFERENCES Educator([EducatorId]),
		  FOREIGN KEY ([SchoolId]) REFERENCES School([SchoolId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);


		CREATE TABLE [EducatorAbsent] (
		  [EducatorAbsentId]  int NOT NULL IDENTITY,
		  [EducatorId] int,
		  [ReasonId] int,
		  [Date] date,
		  PRIMARY KEY ([EducatorAbsentId]),
		  FOREIGN KEY ([EducatorId]) REFERENCES Educator([EducatorId]),
		  FOREIGN KEY ([ReasonId]) REFERENCES Reason([ReasonId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [EducatorSubject] (
		  [EducatorSubjectId]  int NOT NULL IDENTITY,
		  [EducatorId] int,
		  [SubjectId] int,
		  [EffectiveFrom] date,
		  [EffectiveTo] date,
		  PRIMARY KEY ([EducatorSubjectId]),
		  FOREIGN KEY ([EducatorId]) REFERENCES Educator([EducatorId]),
		  FOREIGN KEY ([SubjectId]) REFERENCES [Subject]([SubjectId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [LearnerSubject] (
		  [LearnerSubjectId]  int NOT NULL IDENTITY,
		  [LearnerId] int,
		  [SubjectId] int,
		  [EffectiveFrom] date,
		  [EffectiveTo] date,
		  PRIMARY KEY ([LearnerSubjectId]),
		  FOREIGN KEY ([LearnerId]) REFERENCES Learner([LearnerId]),
		  FOREIGN KEY ([SubjectId]) REFERENCES [Subject]([SubjectId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [LearnerAbsent] (
		  [LearnerAbsentId]  int NOT NULL IDENTITY,
		  [LearnerId] int,
		  [Date] date,
		  PRIMARY KEY ([LearnerAbsentId]),
		  FOREIGN KEY ([LearnerId]) REFERENCES Learner([LearnerId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);

		CREATE TABLE [LearnerSubjectMark] (
		  [LearnerSubjectMarkId]  int NOT NULL IDENTITY,
		  [LearnerSubjectId] int,
		  [YearTermId] int,
		  [Percentage] decimal(8,2),
		  PRIMARY KEY ([LearnerSubjectMarkId]),
		  FOREIGN KEY ([LearnerSubjectId]) REFERENCES LearnerSubject([LearnerSubjectId]),
		  FOREIGN KEY ([YearTermId]) REFERENCES YearTerm([YearTermId])
		  ON DELETE CASCADE
		  ON UPDATE CASCADE
		);


END
GO
