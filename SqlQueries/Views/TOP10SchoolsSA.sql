CREATE VIEW TOP10SchoolsSA
AS
SELECT TOP 10 RANK() OVER (ORDER BY AVG(LM.AvgMark) DESC) [Position] ,E.[Name] [School Name],E1.[Name] [Province], AVG(LM.AvgMark) [Average Mark]--, * --LM.SchoolId, LM.AvgMark--E.[Name] [SchoolName], LM.AvgMark
FROM getEntityLearnerMarks(1,'2018-12-31') LM
JOIN Entity E ON E.EntityId = LM.SchoolId
JOIN Entity E1 ON E1.EntityId = E.ParentEntityId
JOIN Learner L ON L.LearnerId = LM.LearnerId
WHERE E1.ParentEntityId = 1
GROUP BY E.[Name],E1.[Name]
