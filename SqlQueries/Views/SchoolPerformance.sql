--\\\\\\\\\\\\\\\ VIEW FOR SCHOOL PERFOMANCE QUERIES ------------------------------
CREATE VIEW SchoolPerformance

AS
  SELECT Entity.Name AS SchoolName,
		 SchoolType.Description AS SchoolType,
		 provEnt.ProvinceName AS Province,
		 Learner.IDNumber,
		 Subject.Description,

		 (SELECT  AVG(Percentage) 
			 FROM LearnerSubjectMark 
			 WHERE LearnerSubjectMark.LearnerSubjectId=LearnerSubject.SubjectId  ) AS PercentageMarkForSubject,
		Grade.Description as grade,
		YearTerm.Year as Year

	FROM LearnerSchool
		JOIN Learner ON Learner.LearnerId=LearnerSchool.LearnerId
		JOIN School ON LearnerSchool.SchoolId = School.SchoolId
		JOIN Entity ON School.SchoolId=Entity.EntityId
		JOIN LearnerSubject ON Learner.LearnerId= LearnerSubject.LearnerId
	    JOIN  Subject ON LearnerSubject.SubjectId = Subject.SubjectId
		JOIN  Grade ON Subject.GradeId = Grade.GradeId
		JOIN LearnerSubjectMark ON LearnerSubject.LearnerSubjectId=LearnerSubjectMark.LearnerSubjectId
		JOIN YearTerm ON LearnerSubjectMark.YearTermId=YearTerm.YearTermId
		RIGHT OUTER JOIN SchoolType ON School.SchoolTypeId=SchoolType.SchoolTypeId
		JOIN (SELECT
				child.EntityId AS SchoolEntID,
				parent.Name AS ProvinceName
				 FROM Entity child
			INNER JOIN Entity parent ON child.ParentEntityId=parent.EntityId) AS provEnt ON School.EntityId=provEnt.SchoolEntID;
--======================================================================================================================================
			
--Performance per Province
 SELECT Province, AVG( PercentageMarkForSubject) as AvePercentage
	FROM SchoolPerformance 
	GROUP BY Province
	ORDER BY AvePercentage;


 --Performance per Province (School Type)
 SELECT SchoolType, Province, AVG( PercentageMarkForSubject) as AvePercentage
	FROM SchoolPerformance 
	GROUP BY SchoolType, Province
	ORDER BY AvePercentage;
 
 SELECT SchoolName, Province, AVG( PercentageMarkForSubject) as AvePercentage 
	FROM SchoolPerformance 
	GROUP BY SchoolName, Province
	ORDER BY AvePercentage;