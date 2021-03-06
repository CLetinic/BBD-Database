INSERT INTO [Grade]([Description])
VALUES	('Grade 1'),
		('Grade 2'),
		('Grade 3'),
		('Grade 4'),
		('Grade 5'),
		('Grade 6'),
		('Grade 7'),
		('Grade 8'),
		('Grade 9'),
		('Grade 10'),
		('Grade 11'),
		('Grade 12');

INSERT INTO SchoolType([Description],[MinGradeId],[MaxGradeId])
VALUES  ('Primary School',1,7), ('Secondary School',8,12),('Combined School',1,12), ('Intermediate School',4,7);

INSERT INTO [Gender]([Description])
VALUES ('Male'), ('Female');


INSERT INTO [dbo].[EntityType]([Description])
VALUES ('Country') , ('Province'), ('School')

INSERT INTO [Entity]([Name] ,[EntityTypeId],[ParentEntityId])
VALUES ('South Africa',1,null)


INSERT INTO [Entity]([Name] ,[EntityTypeId],[ParentEntityId])
VALUES	('Gauteng',2,1),
		('Western Cape',2,1),
		('Limpopo',2,1),
		('Northern Cape',2,1),
		('Eastern Cape',2,1),
		('Free State',2,1),
		('Mpumalanga',2,1),
		('Kwazulu-Natal',2,1),
		('North West',2,1)

		INSERT INTO [Subject] ([Description],GradeId)
		VALUES	('Afrikaans First Additional Language',1),
		('Afrikaans Home Language',1),
		('English First Additional Language',1),
		('English Home Language',1),
		('Life Skills',1),
		('Mathematics',1),
		('Afrikaans First Additional Language',2),
		('Afrikaans Home Language',2),
		('English First Additional Language',2),
		('English Home Language',2),
		('Life Skills',2),
		('Mathematics',2),
		('Afrikaans First Additional Language',3),
		('Afrikaans Home Language',3),
		('English First Additional Language',3),
		('English Home Language',3),
		('Life Skills',3),
		('Mathematics',3),
		('Afrikaans First Additional Language',4),
		('Afrikaans Home Language',4),
		('English First Additional Language',4),
		('English Home Language',4),
		('Life Orientation',4),
		('Life Skills',4),
		('Mathematics',4),
		('Natural Sciences',4),
		('Natural Sciences and Technology',4),
		('Social Sciences',4),
		('Technology',4),
		('Afrikaans First Additional Language',5),
		('Afrikaans Home Language',5),
		('English First Additional Language',5),
		('English Home Language',5),
		('Life Orientation',5),
		('Life Skills',5),
		('Mathematics',5),
		('Natural Sciences',5),
		('Natural Sciences and Technology',5),
		('Social Sciences',5),
		('Technology',5),
		('Afrikaans First Additional Language',6),
		('Afrikaans Home Language',6),
		('English First Additional Language',6),
		('English Home Language',6),
		('Life Orientation',6),
		('Life Skills',6),
		('Mathematics',6),
		('Natural Sciences',6),
		('Natural Sciences and Technology',6),
		('Social Sciences',6),
		('Technology',6),
		('Afrikaans First Additional Language',7),
		('Afrikaans Home Language',7),
		('Creative Arts ',7),
		('Economic Management Sciences',7),
		('English First Additional Language',7),
		('English Home Language',7),
		('Life Orientation',7),
		('Mathematics',7),
		('Natural Sciences',7),
		('Social Sciences',7),
		('Technology',7),
		('Afrikaans First Additional Language',8),
		('Afrikaans Home Language',8),
		('Creative Arts ',8),
		('Economic Management Sciences',8),
		('English First Additional Language',8),
		('English Home Language',8),
		('Life Orientation',8),
		('Mathematics',8),
		('Natural Sciences',8),
		('Social Sciences',8),
		('Technology',8),
		('Afrikaans First Additional Language',9),
		('Afrikaans Home Language',9),
		('Creative Arts ',9),
		('Economic Management Sciences',9),
		('English First Additional Language',9),
		('English Home Language',9),
		('Life Orientation',9),
		('Mathematics',9),
		('Natural Sciences',9),
		('Social Sciences',9),
		('Technology',9),
		('Accounting',10),
		('Afrikaans First Additional Language',10),
		('Afrikaans Home Language',10),
		('Agricultural Management Practices',10),
		('Agricultural Sciences',10),
		('Business Studies',10),
		('Civil Technology',10),
		('Computer Applications Technology',10),
		('Consumer Studies',10),
		('Economics',10),
		('English First Additional Language',10),
		('English Home Language',10),
		('Geography',10),
		('History',10),
		('Information Technology',10),
		('Life Orientation',10),
		('Life Sciences',10),
		('Mathematical Literacy',10),
		('Mathematics',10),
		('Physical Sciences',10),
		('Tourism',10),
		('Accounting',11),
		('Afrikaans First Additional Language',11),
		('Afrikaans Home Language',11),
		('Agricultural Management Practices',11),
		('Agricultural Sciences',11),
		('Business Studies',11),
		('Civil Technology',11),
		('Computer Applications Technology',11),
		('Consumer Studies',11),
		('Economics',11),
		('English First Additional Language',11),
		('English Home Language',11),
		('Geography',11),
		('History',11),
		('Information Technology',11),
		('Life Orientation',11),
		('Life Sciences',11),
		('Mathematical Literacy',11),
		('Mathematics',11),
		('Physical Sciences',11),
		('Tourism',11),
		('Accounting',12),
		('Afrikaans First Additional Language',12),
		('Afrikaans Home Language',12),
		('Agricultural Management Practices',12),
		('Agricultural Sciences',12),
		('Business Studies',12),
		('Civil Technology',12),
		('Computer Applications Technology',12),
		('Consumer Studies',12),
		('Economics',12),
		('English First Additional Language',12),
		('English Home Language',12),
		('Geography',12),
		('History',12),
		('Information Technology',12),
		('Life Orientation',12),
		('Life Sciences',12),
		('Mathematical Literacy',12),
		('Mathematics',12),
		('Physical Sciences',12),
		('Tourism',12);

		INSERT INTO YearTerm([Year],[Term], [StartDate],[EndDate])
		VALUES (2018,1,'2018-01-17', '2018-03-28'),
			   (2018,2,'2018-04-10', '2018-06-22'),
			   (2018,3,'2018-07-17', '2018-09-28'),
			   (2018,4,'2018-10-9', '2018-12-12'),
			   (2019,1,'2019-01-09', '2019-03-15'),
			   (2019,2,'2019-04-02', '2019-06-14'),
			   (2019,3,'2019-07-09', '2019-09-20'),
			   (2019,4,'2019-10-01', '2019-12-04')

