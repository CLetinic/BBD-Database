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
  [PassPercentage] decimal(8,2),
  PRIMARY KEY ([SubjectId]),
  FOREIGN KEY ([GradeId]) REFERENCES Grade([GradeId])
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
);

CREATE TABLE [SchoolType] (
  [SchoolTypeId] int NOT NULL IDENTITY,
  [Description] varchar(55),
  [MinGradeId] int,
  [MaxGradeId] int,
  PRIMARY KEY ([SchoolTypeId]),
  FOREIGN KEY ([MinGradeId]) REFERENCES Grade([GradeId]),
  FOREIGN KEY ([MaxGradeId]) REFERENCES Grade([GradeId])
);

CREATE TABLE [School] (
  [SchoolId] int NOT NULL IDENTITY,
  [EntityId] int,
  [SchoolTypeId] int,
  PRIMARY KEY ([SchoolId]),
  FOREIGN KEY ([EntityId]) REFERENCES Entity([EntityId]),
  FOREIGN KEY ([SchoolTypeId]) REFERENCES [SchoolType]([SchoolTypeId])
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
);


CREATE TABLE [EducatorAbsent] (
  [EducatorAbsentId]  int NOT NULL IDENTITY,
  [EducatorId] int,
  [ReasonId] int,
  [Date] date,
  PRIMARY KEY ([EducatorAbsentId]),
  FOREIGN KEY ([EducatorId]) REFERENCES Educator([EducatorId]),
  FOREIGN KEY ([ReasonId]) REFERENCES Reason([ReasonId]),
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
);

CREATE TABLE [LearnerAbsent] (
  [LearnerAbsentId]  int NOT NULL IDENTITY,
  [LearnerId] int,
  [Date] date,
  PRIMARY KEY ([LearnerAbsentId]),
  FOREIGN KEY ([LearnerId]) REFERENCES Learner([LearnerId])
);

CREATE TABLE [LearnerSubjectMark] (
  [LearnerSubjectMarkId]  int NOT NULL IDENTITY,
  [LearnerSubjectId] int,
  [YearTermId] int,
  [Percentage] decimal(8,2),
  [EffectiveFrom] date,
  [EffectiveTo] date,
  PRIMARY KEY ([LearnerSubjectMarkId]),
  FOREIGN KEY ([LearnerSubjectId]) REFERENCES LearnerSubject([LearnerSubjectId]),
  FOREIGN KEY ([YearTermId]) REFERENCES YearTerm([YearTermId])
);
