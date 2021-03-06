USE [School]
GO
/****** Object:  StoredProcedure [dbo].[USP_UPD_TEACHER]    Script Date: 11/01/2020 20:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernanda	
-- Create date: 11/01/2020
-- Description:	Update Teacher
-- =============================================
ALTER PROCEDURE [dbo].[USP_UPD_TEACHER] 
(
		@Id				int
	,	@Name			varchar(50)
	,	@Skills			varchar(250)
	,	@TotalStudents	int
	,	@Salary			money
	,	@AddeOn			date
)
	
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE Teacher 
	SET  
			[Name] = @Name
		,	[Skills] = @Skills
		,	[TotalStudents] = @TotalStudents
		,	[Salary] = @Salary
		,	[AddeOn] = @AddeOn

	WHERE 
		[Id] = @Id

	SELECT 
		[Id]
	,	[Name]
	,	[Skills]
	,	[TotalStudents]
	,	[Salary]
	,	[AddeOn]

	FROM Teacher

	WHERE 

		[Id] = @Id

END

