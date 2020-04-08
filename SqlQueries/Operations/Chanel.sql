--Displays school id, school's name and school's type
SELECT 
	School.SchoolId, 	
	SchoolType.Description AS SchoolType,
	Entity.Name AS SchoolName
FROM School
RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId;
GO

-- Displays school id, school's name, school's type and school province
SELECT 
	School.SchoolId, 	
	SchoolType.Description AS SchoolType,
	Entity.Name AS SchoolName,
	provEnt.ProvinceName AS Province
FROM School
RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId
JOIN (SELECT
		child.EntityId AS SchoolEntID,
		parent.Name AS ProvinceName
	 FROM Entity child
	 INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId) AS provEnt ON School.EntityId=provEnt.SchoolEntID;
GO

-- no working
-- Displays school id, school's name, school's type and school province
--SELECT 
--	School.SchoolId, 	
--	SchoolType.Description AS SchoolType,
--	Entity.Name AS SchoolName,
--	provEnt.ProvinceName AS Province,
--	*
--FROM School
--RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
--RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId
--JOIN (SELECT
--		child.EntityId AS SchoolEntID,
--		child.ParentEntityId AS SchoolParent,
--		child.Name AS SchoolName,
--		parent.EntityId AS ProvinceEntID,
--		parent.ParentEntityId AS ProvinceParent,
--		parent.Name AS ProvinceName
--	 FROM Entity child
--	 INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId) AS provEnt ON School.EntityId=provEnt.SchoolEntID
--JOIN (SELECT
--		child.EntityId AS ProvinceEntID,
--		child.ParentEntityId AS ProvinceParent,
--		child.Name AS ProvinceName,
--		parent.EntityId AS CountryEntID,
--		parent.ParentEntityId AS CountryParent,
--		parent.Name AS CountryName
--	 FROM Entity child
--	 INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId) AS countEnt ON School.EntityId=provEnt.SchoolEntID;
--GO

---- Displays the parent name of an entity
--SELECT
--		child.EntityId AS ProvinceEntID,
--		child.ParentEntityId AS ProvinceParent,
--		child.Name AS ProvinceName,
--		parent.EntityId AS CountryEntID,
--		parent.ParentEntityId AS CountryParent,
--		parent.Name AS CountryName
--	 FROM Entity child
--	 INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId

-- Needs fixing ! sometimes shows provinces
-- Display Student ID number, First Name, Last name, Birthdate, Gender, School, and started at that school
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

-- Needs fixing ! sometimes shows provinces
-- Display Educator ID number, First Name, Last name, Birthdate, Gender, School, and started at that school
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

-- Display Total amount of students registered for a subject
SELECT
	Subject.SubjectId,
	Subject.Description AS Subject, 
	(SELECT COUNT(*) 
	 FROM LearnerSubject 
	 WHERE LearnerSubject.SubjectId = Subject.SubjectId
	 HAVING COUNT(*)>0) AS NumberOfStudentTakenSubject
FROM Subject
WHERE (SELECT COUNT(*) 
	 FROM LearnerSubject 
	 WHERE LearnerSubject.SubjectId = Subject.SubjectId
	 HAVING COUNT(*)>0) IS NOT NULL
GO
-- From susan
--SELECT LS.SubjectId, LSS.SchoolId, COUNT(LearnerSubjectID)--FROM LearnerSubject LS--JOIN LearnerSchool LSS ON LSS.LearnerId = LS.LearnerId--GROUP BY LS.SubjectId, LSS.SchoolId

-- Display Subject's ID, Name, and the Average Mark for that subject
-- should be rounded? 
SELECT DISTINCT
	Subject.SubjectId,
	Subject.Description,
	--LearnerSubjectMark.Percentage
	(SELECT AVG(Percentage) 
	 FROM LearnerSubjectMark 
	 WHERE LearnerSubjectMark.LearnerSubjectId=LearnerSubject.SubjectId) AS AveragePercentageMarkForSubject
FROM Subject
JOIN LearnerSubject ON Subject.SubjectId=LearnerSubject.SubjectId
JOIN LearnerSubjectMark ON LearnerSubject.LearnerSubjectId=LearnerSubjectMark.LearnerSubjectId
ORDER BY Subject.SubjectId

--Displays school id, school's name and the number of Students and Educators
SELECT 
	School.SchoolId, 	
	Entity.Name AS SchoolName,
	(SELECT COUNT(*) 
		FROM LearnerSchool
		WHERE LearnerSchool.SchoolId = School.SchoolId) AS NumberOfStudents,
	 (SELECT COUNT(*) 
		FROM EducatorSchool
		WHERE EducatorSchool.SchoolId = School.SchoolId) AS NumberOfEducators
FROM School
RIGHT OUTER JOIN Entity ON School.EntityId=Entity.EntityID
WHERE ((SELECT COUNT(*) 
		FROM LearnerSchool
		WHERE LearnerSchool.SchoolId = School.SchoolId) > 0
		AND
	 (SELECT COUNT(*) 
		FROM EducatorSchool
		WHERE EducatorSchool.SchoolId = School.SchoolId) > 0) 
ORDER BY School.SchoolId;
GO

