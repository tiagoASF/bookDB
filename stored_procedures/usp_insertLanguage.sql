USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertLanguage', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertLanguage;
GO

-- =======================================================
-- Create Stored Procedure usp_insertLanguage
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a language in book.language
-- =============================================
CREATE PROCEDURE book.usp_insertLanguage (
    @languageName nvarchar(50)
)
AS
BEGIN

SET NOCOUNT ON

INSERT INTO book.language
	VALUES(@languageName)

END
GO

/*DECLARE @newcountry_id INT;
EXEC usp_insertCountry 'South Korea', @country_id = @newcountry_id OUTPUT
SELECT @newcountry_id;
GO*/
