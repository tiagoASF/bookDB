IF OBJECT_ID('book.usp_insertAuthor', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertAuthor;
GO

-- =======================================================
-- Create Stored Procedure usp_insertAuthor
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/22/2024
-- Description: Insert an author in book.author
-- =============================================
CREATE PROCEDURE book.usp_insertAuthor (
    @name nvarchar(50),
    @country nvarchar(50),
    @is_nobel BIT
)
AS
BEGIN

SET NOCOUNT ON

DECLARE @country_ID INT;

IF NOT EXISTS (SELECT id FROM country WHERE country_name = @country)
    EXEC dbo.usp_insertCountry @country

SET @country_ID = (SELECT id FROM country WHERE country_name = @country)

IF NOT EXISTS (SELECT id FROM book.author WHERE author_name = @name AND country_id = @country_ID)
        INSERT INTO book.author (author_name, country_id, is_nobel_prize_winner)
        VALUES(@name, @country_ID, @is_nobel)

END
GO