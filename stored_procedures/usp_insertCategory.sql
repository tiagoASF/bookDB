USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertCategory', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertCategory;
GO

-- =======================================================
-- Create Stored Procedure usp_insertCategory
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a language in book.category
-- =============================================
CREATE PROCEDURE book.usp_insertCategory (
    @categoryName nvarchar(50),
    @category_id INT OUTPUT
)
AS
BEGIN

SET NOCOUNT ON

INSERT INTO book.category
	VALUES(@categoryName)

SELECT @category_id = SCOPE_IDENTITY()

END
GO

/*DECLARE @newcountry_id INT;
EXEC usp_insertCountry 'South Korea', @country_id = @newcountry_id OUTPUT
SELECT @newcountry_id;
GO*/
