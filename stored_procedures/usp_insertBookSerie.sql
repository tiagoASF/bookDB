USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertBookSerie', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertBookSerie;
GO

-- =======================================================
-- Create Stored Procedure usp_insertBookSerie
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a bookSerie in book.bookSerie
-- =============================================
CREATE PROCEDURE book.usp_insertBookSerie (
    @bookSerieName nvarchar(50)
)
AS
BEGIN

SET NOCOUNT ON

INSERT INTO book.book_serie
	VALUES(@bookSerieName)

END
GO

/*DECLARE @newcountry_id INT;
EXEC usp_insertCountry 'South Korea', @country_id = @newcountry_id OUTPUT
SELECT @newcountry_id;
GO*/
