--Grade 1 all subjects

INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1 AND 120  AND GradeId = 1
GO

--Grade 2 all subjects
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 121 AND 235 AND GradeId = 2
GO

--Grade 3 all subjects
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 236 AND 350 AND GradeId = 3
GO

--Grade 4 all subjects
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 351 AND 470 AND GradeId = 4
GO


--Grade 5,6 afr HL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 471 AND 480 AND SubjectID IN (31,42)
GO

--Grade 5,6 afr AL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 481 AND 495 AND SubjectID IN (30,41)
GO


--Grade 5,6 eng HL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 496 AND 505 AND SubjectID IN (32,43)
GO

--Grade 5,6 eng AL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 506 AND 520 AND SubjectID IN (33,44)
GO

--Grade 5,6 life orientation
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 521 AND 530 AND SubjectID IN (34,45)
GO

--Grade 5,6 life skills
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 531 AND 545 AND SubjectID IN (35,46)
GO

--Grade 5,6 maths
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 546 AND 565 AND SubjectID IN (36,47)
GO


--Grade 5,6 Natural Sciences & Technology (not combined)
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 566 AND 595 AND SubjectID IN (37,40,48,51)
GO

--Grade 5,6 Natural Sciences & Technology (combined)
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 596 AND 620 AND SubjectID IN (38,49)
GO

--Grade 5,6 Social Sciences 
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 621 AND 645 AND SubjectID IN (39,50)
GO

--Grade 7,8,9 AFR HL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 646 AND 665 AND SubjectID IN (52,63,74)
GO

--Grade 7,8,9 AFR AL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 666 AND 685 AND SubjectID IN (53,64,75)
GO

--Grade 7,8,9 Creative Arts
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 686 AND 720 AND SubjectID IN (54,65,76)
GO

--Grade 7,8,9 Economic Management Sciences
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 721 AND 755 AND SubjectID IN (55,66,77)
GO

--Grade 7,8,9 ENG HL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 756 AND 775 AND SubjectID IN (56,67,78)
GO

--Grade 7,8,9 ENG AL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 776 AND 795 AND SubjectID IN (57,68,79)
GO

--Grade 7,8,9 LO
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 796 AND 830 AND SubjectID IN (58,69,80)
GO


--Grade 7,8,9 Maths
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 831 AND 865 AND SubjectID IN (59,70,81)
GO

--Grade 7,8,9 Natural Sciences
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 866 AND 900 AND SubjectID IN (60,71,82)
GO

--Grade 7,8,9 Natural Sciences
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 901 AND 935 AND SubjectID IN (61,72,83)
GO

--Grade 7,8,9 Natural Sciences
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 936 AND 970 AND SubjectID IN (62,73,84)
GO

--Grade 10,11,12 Accounting
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 971 AND 990 AND SubjectID IN (85,106,127)
GO

--Grade 10,11,12 AFR HL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 991 AND 1005 AND SubjectID IN (86,107,128)
GO

--Grade 10,11,12 AFR AL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1006 AND 1020 AND SubjectID IN (87,108,129)
GO

--Grade 10,11,12 Agricultual Management
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1021 AND 1035 AND SubjectID IN (88,109,130)
GO


--Grade 10,11,12 Agricultual Sciences
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1036 AND 1055 AND SubjectID IN (89,110,131)
GO

--Grade 10,11,12 Business Studies
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1056 AND 1075 AND SubjectID IN (90,111,132)
GO

--Grade 10,11,12 Civil Technology
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1076 AND 1095 AND SubjectID IN (91,112,133)
GO


--Grade 10,11,12 CAT
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1096 AND 1115 AND SubjectID IN (92,113,134)
GO

--Grade 10,11,12 Consumers
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1116 AND 1135 AND SubjectID IN (93,114,135)
GO

--Grade 10,11,12 Economics
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1136 AND 1155 AND SubjectID IN (94,115,136)
GO


--Grade 10,11,12 ENG HL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1156 AND 1165 AND SubjectID IN (95,116,137)
GO

--Grade 10,11,12 ENG AL
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1166 AND 1185 AND SubjectID IN (96,117,138)
GO

--Grade 10,11,12 Geography
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1186 AND 1205 AND SubjectID IN (97,118,139)
GO

--Grade 10,11,12 HISTORY
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1206 AND 1225 AND SubjectID IN (98,119,140)
GO

--Grade 10,11,12 IT
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1226 AND 1245 AND SubjectID IN (99,120,141)
GO


--Grade 10,11,12 LO
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1246 AND 1260 AND SubjectID IN (100,121,142)
GO

--Grade 10,11,12 Life Sciences
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1261 AND 1280 AND SubjectID IN (101,122,143)
GO

--Grade 10,11,12 Math Lit
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1281 AND 1300 AND SubjectID IN (102,123,144)
GO

--Grade 10,11,12 Math
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1301 AND 1320 AND SubjectID IN (103,124,145)
GO

--Grade 10,11,12 Physical
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1321 AND 1340 AND SubjectID IN (104,125,146)
GO

--Grade 10,11,12 Tourism
INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
FROM Educator E
JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
CROSS JOIN Subject
WHERE E.EducatorId BETWEEN 1341 AND 1355 AND SubjectID IN (105,126,147)
GO
