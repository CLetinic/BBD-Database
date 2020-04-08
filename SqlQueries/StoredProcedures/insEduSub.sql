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
CREATE PROCEDURE insEduSub

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		DECLARE @SchoolId int = 1;
		DECLARE @SchoolTypeId int;



		WHILE @SchoolId < (SELECT COUNT(SchoolId) FROM School)
			BEGIN
				SELECT @SchoolTypeId = SchoolTypeId FROM School WHERE SchoolId = @SchoolId

				IF @SchoolTypeId = 1
					BEGIN 
						DECLARE @Educators TABLE
						(
							RowId int,
							EducatorId int
						)

						INSERT INTO @Educators
						SELECT ROW_NUMBER() OVER(ORDER BY EducatorId) [RowId], ES.EducatorId
						FROM Entity E
						JOIN School S
						ON S.EntityId = E.EntityId
						JOIN EducatorSchool ES
						ON ES.SchoolId = S.SchoolId
						WHERE SchoolTypeId = @SchoolTypeId AND @SchoolId = S.SchoolId
	
						DECLARE @EducatorCount int = (SELECT COUNT(*) FROM @Educators)


						DECLARE @From int = 0
						DECLARE @To int = 1

						DECLARE @GradeId int = 1
						WHILE @GradeId < 5
							BEGIN
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To  AND GradeId = @GradeId


								SET @GradeId = @GradeId + 1

								SET @From = @To
								SET @To = @To + 1
							END

						--select * from @Educators
						--print(@To)
	
						DECLARE @FromSubject int = 30
						DECLARE @ToSubject int = 40
	
						SET @To = @From + 1
	
						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 5,6 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+11)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				
						--SET @To = @From + 1
				
						SET @FromSubject = 52
						SET @ToSubject = 62

						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 7 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				END
				IF @SchoolTypeId = 2
					BEGIN 
				
						INSERT INTO @Educators
						SELECT ROW_NUMBER() OVER(ORDER BY EducatorId) [RowId], ES.EducatorId
						FROM Entity E
						JOIN School S
						ON S.EntityId = E.EntityId
						JOIN EducatorSchool ES
						ON ES.SchoolId = S.SchoolId
						WHERE SchoolTypeId = @SchoolTypeId AND @SchoolId = S.SchoolId
	
				
						SET @From = 0
						SET @To  = @From + 1

						SET @FromSubject  = 63
						SET @ToSubject = 72

						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 8,9 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+11)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				
						SET @FromSubject  = 85
						SET @ToSubject = 105

						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 8,9 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+21,@FromSubject+42)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
					END
				IF @SchoolTypeId = 3
					BEGIN 
				
						INSERT INTO @Educators
						SELECT ROW_NUMBER() OVER(ORDER BY EducatorId) [RowId], ES.EducatorId
						FROM Entity E
						JOIN School S
						ON S.EntityId = E.EntityId
						JOIN EducatorSchool ES
						ON ES.SchoolId = S.SchoolId
						WHERE SchoolTypeId = @SchoolTypeId AND @SchoolId = S.SchoolId
	
				
						SET @From = 0
						SET @To  = @From + 1

						SET @GradeId = 1
						WHILE @GradeId < 5
							BEGIN
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To  AND GradeId = @GradeId


								SET @GradeId = @GradeId + 1

								SET @From = @To
								SET @To = @To + 1
							END
				

						SET @FromSubject  = 30
						SET @ToSubject = 40
	
						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 5,6 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+11)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				
						SET @FromSubject  = 52
						SET @ToSubject = 62

						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 7,8,9 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+11,@FromSubject+22)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				
						SET @FromSubject  = 85
						SET @ToSubject = 105

						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 10,11,12 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+21,@FromSubject+42)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
					END

				IF @SchoolTypeId = 4
					BEGIN 
				
						INSERT INTO @Educators
						SELECT ROW_NUMBER() OVER(ORDER BY EducatorId) [RowId], ES.EducatorId
						FROM Entity E
						JOIN School S
						ON S.EntityId = E.EntityId
						JOIN EducatorSchool ES
						ON ES.SchoolId = S.SchoolId
						WHERE SchoolTypeId = @SchoolTypeId AND @SchoolId = S.SchoolId
	
				
						SET @From = 0
						SET @To  = @From + 1

						SET @GradeId = 4
				
						INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
						SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
						FROM Educator E
						JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
						JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
						CROSS JOIN Subject
						WHERE Eds.RowId BETWEEN (@From+1) AND @To  AND GradeId = @GradeId


						SET @GradeId = @GradeId + 1

						SET @From = @To
						SET @To = @To + 1
							
						SET @FromSubject  = 30
						SET @ToSubject = 40
	
						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 5,6 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject,@FromSubject+11)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				
						SET @FromSubject  = 52
						SET @ToSubject = 62

						WHILE @FromSubject <= @ToSubject
							BEGIN 
								--Grade 7 subjects
								INSERT INTO [dbo].[EducatorSubject] ([EducatorId],[SubjectId],[EffectiveFrom],[EffectiveTo])
								SELECT E.EducatorId,SubjectId ,ES.EffectiveFrom, '9999-12-31'
								FROM Educator E
								JOIN EducatorSchool ES ON ES.EducatorId = E.EducatorId
								JOIN @Educators Eds ON Eds.EducatorId = E.EducatorId
								CROSS JOIN Subject
								WHERE Eds.RowId BETWEEN (@From+1) AND @To AND SubjectID IN (@FromSubject)
		
								SET @From = @To
								SET @To = @To + 1

								SET @FromSubject = @FromSubject + 1
							END 
				
					END
	
			DELETE FROM @Educators
			SET @SchoolId = @SchoolId + 1


			END
END
GO
