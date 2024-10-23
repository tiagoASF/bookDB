USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertAward', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertAward;
GO

-- =======================================================
-- Create Stored Procedure usp_insertAward
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a award in book.award
-- =============================================
CREATE PROCEDURE book.usp_insertAward (
    @awardName nvarchar(50)
)
AS
BEGIN

SET NOCOUNT ON

INSERT INTO book.award
	VALUES(@awardName)

END
GO
