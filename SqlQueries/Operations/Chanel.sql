--Displays school id, school's name and school's type
SELECT 
	School.SchoolId, 	
	SchoolType.Description AS SchoolType,
	Entity.Name AS SchoolName
FROM School
RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId;
GO

--Displays Entity name, and the name of the ParentEntity
--SELECT
--		t1.EntityId,
--		t2.Name
--	 FROM Entity t1
--	 INNER JOIN Entity t2 ON t1.ParentEntityId=t2.EntityId


-- Trying to display school id, school's name and school's type and school province
--SELECT 
--	School.SchoolId, 
--	Entity.Name AS SchoolName, 
--	SchoolType.Description AS SchoolType,
--	(SELECT
--		t1.Name AS Province,
--		t2.Name
--	 FROM Entity t1
--	 INNER JOIN Entity t2 ON t1.ParentEntityId=t2.EntityId)
--FROM School
--RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
--RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId;
--GO

-- Display Student ID number, First Name, Last name, Birthdate, Gender, School, and started at that school
-- sometimes shows provinces instead of school
SELECT
	Learner.IDNumber,
	Learner.FirstName,
	Learner.LastName,
	Learner.BirthDate,
	Gender.Description AS Gender,
	Entity.Name AS SchoolName,
	LearnerSchool.EffectiveFrom,
	LearnerSchool.EffectiveTo
FROM LearnerSchool
JOIN Learner ON LearnerSchool.LearnerId=Learner.LearnerId
JOIN Gender ON Learner.GenderId=Gender.GenderId
JOIN School ON LearnerSchool.SchoolId = School.SchoolId
JOIN Entity ON School.SchoolId=Entity.EntityId
GO

-- Display Educator ID number, First Name, Last name, Birthdate, Gender, School, and started at that school
-- sometimes shows provinces instead of school
SELECT
	Educator.IDNumber,
	Educator.FirstName,
	Educator.LastName,
	Educator.BirthDate,
	Gender.Description AS Gender,
	Entity.Name AS SchoolName,
	EducatorSchool.EffectiveFrom,
	EducatorSchool.EffectiveTo
FROM EducatorSchool
JOIN Educator ON EducatorSchool.EducatorId=Educator.EducatorId
JOIN Gender ON Educator.GenderId=Gender.GenderId
JOIN School ON EducatorSchool.SchoolId = School.SchoolId
JOIN Entity ON School.SchoolId=Entity.EntityId
GO