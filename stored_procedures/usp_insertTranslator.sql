USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertTranslator', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertTranslator;
GO

-- =======================================================
-- Create Stored Procedure usp_insertTranslator
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a translator in book.translator
-- =============================================
CREATE PROCEDURE book.usp_insertTranslator (
    @translatorName nvarchar(50),
    @translator_id INT OUTPUT
)
AS
BEGIN

SET NOCOUNT ON

INSERT INTO book.translator
	VALUES(@translatorName)

SELECT @translator_id = SCOPE_IDENTITY()

END
GO

/*DECLARE @newcountry_id INT;
EXEC usp_insertCountry 'South Korea', @country_id = @newcountry_id OUTPUT
SELECT @newcountry_id;
GO*/
