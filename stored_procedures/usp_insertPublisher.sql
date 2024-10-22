USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertPublisher', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertPublisher;
GO

-- =======================================================
-- Create Stored Procedure usp_insertPublisher
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a publisher in book.publisher
-- =============================================
CREATE PROCEDURE book.usp_insertPublisher (
    @publisherName nvarchar(50),
    @publisherCountry nvarchar(50),
    @publisher_id INT OUTPUT
)
AS
BEGIN

SET NOCOUNT ON

DECLARE @country_ID INT;

IF NOT EXISTS (SELECT id FROM country WHERE country_name = @publisherCountry)
    EXEC dbo.usp_insertCountry
        @publisherCountry, @country_id = @country_ID OUTPUT;
ELSE
    SELECT id FROM country WHERE country_name = @publisherCountry


IF NOT EXISTS (SELECT id FROM book.publisher WHERE publisher_name = @publisherName AND country_id = @country_ID)
        INSERT INTO book.publisher (publisher_name, country_id)
        VALUES(@publisherName, @country_ID)

SELECT @publisher_id = SCOPE_IDENTITY()
END
GO







/*DECLARE @newcountry_id INT;
EXEC usp_insertCountry 'South Korea', @country_id = @newcountry_id OUTPUT
SELECT @newcountry_id;
GO*/