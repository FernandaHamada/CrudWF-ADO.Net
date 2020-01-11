USE [School]
GO
/****** Object:  StoredProcedure [dbo].[USP_DEL_TEACHER]    Script Date: 11/01/2020 20:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernanda
-- Create date: 09/01/2020
-- Description:	Delete Teacher
-- =============================================
ALTER PROCEDURE [dbo].[USP_DEL_TEACHER] 
(
		@Id int

)

AS
BEGIN

	SET NOCOUNT ON;

   DELETE Teacher
   WHERE Id = @Id
END
