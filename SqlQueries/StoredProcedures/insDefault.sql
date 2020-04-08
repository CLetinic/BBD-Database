-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE insDefault
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
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

		INSERT INTO [Subject] ([GradeId],[Description],[Required],[PassPercentage])
		VALUES  ( 1,'Afrikaans First Additional Language',1,50),
				( 1,'Afrikaans Home Language',1,50),
				( 1,'English First Additional Language',1,50),
				( 1,'English Home Language',1,50),
				( 1,'Life Skills',1,40),
				( 1,'Mathematics',1,40),
				( 2,'Afrikaans First Additional Language',1,50),
				( 2,'Afrikaans Home Language',1,50),
				( 2,'English First Additional Language',1,50),
				( 2,'English Home Language',1,50),
				( 2,'Life Skills',1,40),
				( 2,'Mathematics',1,40),
				( 3,'Afrikaans First Additional Language',1,50),
				( 3,'Afrikaans Home Language',1,50),
				( 3,'English First Additional Language',1,50),
				( 3,'English Home Language',1,50),
				( 3,'Life Skills',1,40),
				( 3,'Mathematics',1,40),
				( 4,'Afrikaans First Additional Language',1,50),
				( 4,'Afrikaans Home Language',1,50),
				( 4,'English First Additional Language',1,50),
				( 4,'English Home Language',1,50),
				( 4,'Life Orientation',1,40),
				( 4,'Life Skills',1,40),
				( 4,'Mathematics',1,40),
				( 4,'Natural Sciences',1,40),
				( 4,'Natural Sciences and Technology',1,40),
				( 4,'Social Sciences',1,40),
				( 4,'Technology',1,40),
				( 5,'Afrikaans First Additional Language',1,50),
				( 5,'Afrikaans Home Language',1,50),
				( 5,'English First Additional Language',1,50),
				( 5,'English Home Language',1,50),
				( 5,'Life Orientation',1,40),
				( 5,'Life Skills',1,40),
				( 5,'Mathematics',1,40),
				( 5,'Natural Sciences',1,40),
				( 5,'Natural Sciences and Technology',1,40),
				( 5,'Social Sciences',1,40),
				( 5,'Technology',1,40),
				( 6,'Afrikaans First Additional Language',1,50),
				( 6,'Afrikaans Home Language',1,50),
				( 6,'English First Additional Language',1,50),
				( 6,'English Home Language',1,50),
				( 6,'Life Orientation',1,40),
				( 6,'Life Skills',1,40),
				( 6,'Mathematics',1,40),
				( 6,'Natural Sciences',1,40),
				( 6,'Natural Sciences and Technology',1,40),
				( 6,'Social Sciences',1,40),
				( 6,'Technology',1,40),
				( 7,'Afrikaans First Additional Language',1,50),
				( 7,'Afrikaans Home Language',1,50),
				( 7,'Creative Arts ',1,40),
				( 7,'Economic Management Sciences',1,40),
				( 7,'English First Additional Language',1,50),
				( 7,'English Home Language',1,50),
				( 7,'Life Orientation',1,40),
				( 7,'Mathematics',1,40),
				( 7,'Natural Sciences',1,40),
				( 7,'Social Sciences',1,40),
				( 7,'Technology',1,40),
				( 8,'Afrikaans First Additional Language',1,50),
				( 8,'Afrikaans Home Language',1,50),
				( 8,'Creative Arts ',1,40),
				( 8,'Economic Management Sciences',1,40),
				( 8,'English First Additional Language',1,50),
				( 8,'English Home Language',1,50),
				( 8,'Life Orientation',1,40),
				( 8,'Mathematics',1,40),
				( 8,'Natural Sciences',1,40),
				( 8,'Social Sciences',1,40),
				( 8,'Technology',1,40),
				( 9,'Afrikaans First Additional Language',1,50),
				( 9,'Afrikaans Home Language',1,50),
				( 9,'Creative Arts ',1,40),
				( 9,'Economic Management Sciences',1,40),
				( 9,'English First Additional Language',1,50),
				( 9,'English Home Language',1,50),
				( 9,'Life Orientation',1,40),
				( 9,'Mathematics',1,40),
				( 9,'Natural Sciences',1,40),
				( 9,'Social Sciences',1,40),
				( 9,'Technology',1,40),
				( 10,'Accounting',0,40),
				( 10,'Afrikaans First Additional Language',1,50),
				( 10,'Afrikaans Home Language',1,50),
				( 10,'Agricultural Management Practices',0,40),
				( 10,'Agricultural Sciences',0,40),
				( 10,'Business Studies',0,40),
				( 10,'Civil Technology',0,40),
				( 10,'Computer Applications Technology',0,40),
				( 10,'Consumer Studies',0,40),
				( 10,'Economics',0,40),
				( 10,'English First Additional Language',1,50),
				( 10,'English Home Language',1,50),
				( 10,'Geography',0,40),
				( 10,'History',0,40),
				( 10,'Information Technology',0,40),
				( 10,'Life Orientation',0,40),
				( 10,'Life Sciences',0,40),
				( 10,'Mathematical Literacy',1,40),
				( 10,'Mathematics',1,40),
				( 10,'Physical Sciences',0,40),
				( 10,'Tourism',0,40),
				( 11,'Accounting',0,40),
				( 11,'Afrikaans First Additional Language',1,50),
				( 11,'Afrikaans Home Language',1,50),
				( 11,'Agricultural Management Practices',0,40),
				( 11,'Agricultural Sciences',0,40),
				( 11,'Business Studies',0,40),
				( 11,'Civil Technology',0,40),
				( 11,'Computer Applications Technology',0,40),
				( 11,'Consumer Studies',0,40),
				( 11,'Economics',0,40),
				( 11,'English First Additional Language',1,50),
				( 11,'English Home Language',1,50),
				( 11,'Geography',0,40),
				( 11,'History',0,40),
				( 11,'Information Technology',0,40),
				( 11,'Life Orientation',0,40),
				( 11,'Life Sciences',0,40),
				( 11,'Mathematical Literacy',1,40),
				( 11,'Mathematics',1,40),
				( 11,'Physical Sciences',0,40),
				( 11,'Tourism',0,40),
				( 12,'Accounting',0,40),
				( 12,'Afrikaans First Additional Language',1,50),
				( 12,'Afrikaans Home Language',1,50),
				( 12,'Agricultural Management Practices',0,40),
				( 12,'Agricultural Sciences',0,40),
				( 12,'Business Studies',0,40),
				( 12,'Civil Technology',0,40),
				( 12,'Computer Applications Technology',0,40),
				( 12,'Consumer Studies',0,40),
				( 12,'Economics',0,40),
				( 12,'English First Additional Language',1,50),
				( 12,'English Home Language',1,50),
				( 12,'Geography',0,40),
				( 12,'History',0,40),
				( 12,'Information Technology',0,40),
				( 12,'Life Orientation',0,40),
				( 12,'Life Sciences',0,40),
				( 12,'Mathematical Literacy',1,40),
				( 12,'Mathematics',1,40),
				( 12,'Physical Sciences',0,40),
				( 12,'Tourism',0,40);



		INSERT INTO YearTerm([Year],[Term], [StartDate],[EndDate])
		VALUES (2018,1,'2018-01-17', '2018-03-28'),
			   (2018,2,'2018-04-10', '2018-06-22'),
			   (2018,3,'2018-07-17', '2018-09-28'),
			   (2018,4,'2018-10-9', '2018-12-12'),
			   (2019,1,'2019-01-09', '2019-03-15'),
			   (2019,2,'2019-04-02', '2019-06-14'),
			   (2019,3,'2019-07-09', '2019-09-20'),
			   (2019,4,'2019-10-01', '2019-12-04')


END
GO
