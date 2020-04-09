CREATE VIEW TOP100LearnersSA
AS
SELECT TOP 100 RANK() OVER (ORDER BY LM.AvgMark DESC) [Position] , L.FirstName+ ' ' + L.LastName [Learner Name] ,E.[Name] [School Name],E1.[Name] [Province], LM.AvgMark --, * --LM.SchoolId, LM.AvgMark--E.[Name] [SchoolName], LM.AvgMark
FROM getEntityLearnerMarks(1,'2018-12-31') LM
JOIN Entity E ON E.EntityId = LM.SchoolId
JOIN Entity E1 ON E1.EntityId = E.ParentEntityId
JOIN Learner L ON L.LearnerId = LM.LearnerId
WHERE E1.ParentEntityId = 1

