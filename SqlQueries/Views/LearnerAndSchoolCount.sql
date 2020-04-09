
--Learner Count View
CREATE VIEW Learners
AS
-- ID number, First Name, Last name, Birthdate, Gender, School, and started at that school
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
---------------------------------------------------

-- Count the Number of learners in each School
SELECT SchoolName, Gender, COUNT(*) as Total FROM Learners 
GROUP BY SchoolName, Gender
ORDER BY SchoolName;

----------------------------------------------------------
CREATE VIEW SchoolsCount
--Count the number of schools in each province
AS
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
	 -------------------------------------------------------------

SELECT SchoolType, Province, COUNT(*) as Number
	FROM SchoolsCount
	GROUP BY SchoolType,Province;