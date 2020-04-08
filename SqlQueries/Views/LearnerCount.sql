
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