USE [School]
GO
/****** Object:  StoredProcedure [dbo].[USP_SEL_TEACHER]    Script Date: 11/01/2020 20:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Fernanda
-- Create date: 05/01/2020
-- Description: Get Teachers 
-- =============================================
ALTER PROCEDURE [dbo].[USP_SEL_TEACHER] 
		@Id		int				=		null
	,	@Name	varchar(50)		=		null 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		[Id]
	,	[Name]
	,	[Skills]
	,	[TotalStudents]
	,	[Salary]
	,	[AddeOn]
	
	FROM 
		Teacher
	WHERE
		(
			Id = @Id
		Or
			@Id is null
		)
	AND
		(
			[Name] = @Name
		Or
			@Name is null
		)
END
