USE [School]
GO
/****** Object:  StoredProcedure [dbo].[USP_INS_TEACHER]    Script Date: 11/01/2020 20:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Fernanda
-- Create date: 05/01/2020
-- Description: Insert Teachers 
-- =============================================
ALTER PROCEDURE [dbo].[USP_INS_TEACHER]
		@Name			varchar(50)
	,	@Skills			varchar(250)
	,	@TotalStudents	int
	,	@Salary			money
	,	@AddeOn			date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Teacher
	(
		[Name]
	,	[Skills]
	,	[TotalStudents]
	,	[Salary]
	,	[AddeOn]
	) 
	values
	(
		@Name
	,	@Skills
	,	@TotalStudents
	,	@Salary
	,	@AddeOn
	)

END
