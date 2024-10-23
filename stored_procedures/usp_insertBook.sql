USE BooksDB;
GO

IF OBJECT_ID('book.usp_insertBook', 'P') IS NOT NULL
	DROP PROCEDURE book.usp_insertBook;
GO

-- =======================================================
-- Create Stored Procedure usp_insertBook
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/21/2024
-- Description: Insert a translator in book.book
-- =============================================

CREATE PROCEDURE book.usp_insertBook (
    @title NVARCHAR(100),
    @pages SMALLINT,
    @edition TINYINT,
    @ISBN13 CHAR(20),
    @ISBN10 CHAR(20),
    @published_at CHAR(4),
    @first_published_at CHAR(4),
    @first_published_era CHAR(4),
    @category VARCHAR(50),
    @book_serie VARCHAR(50),
    @language VARCHAR(50),
    @original_language VARCHAR(50),
    @original_country VARCHAR(50),
    @translator VARCHAR(50),
    @format VARCHAR(50),
    @size VARCHAR(50),
    @publisher VARCHAR(50),
    @publisherCountry VARCHAR(50),
    @author NVARCHAR(50),
    @author_country VARCHAR(50),
    @author_nobelPrize BIT,
    @award VARCHAR(50)
) AS
BEGIN
    SET NOCOUNT ON

    DECLARE @original_country_ID INT;
    DECLARE @category_ID INT;
    DECLARE @language_ID INT;
    DECLARE @original_language_ID INT;
    DECLARE @translator_ID INT;
    DECLARE @publisher_ID INT;
    DECLARE @bookserie_ID INT;
    DECLARE @author_ID INT;
    DECLARE @publisherCountry_ID INT;
    DECLARE @author_country_ID INT;
    DECLARE @book_ID INT;
    DECLARE @award_ID INT;

    BEGIN --Insere e retorna id do país de origem do livro
    IF NOT EXISTS(SELECT 1 FROM country WHERE country_name = @original_country)
        EXEC dbo.usp_insertCountry @original_country, @country_id = @original_country_ID OUTPUT

    SET @original_country_ID = (SELECT id FROM country WHERE country_name = @original_country)
    END

    BEGIN --Insere e retorna id da categoria do livro
    IF NOT EXISTS(SELECT 1 FROM book.category WHERE category_name = @category)
        EXEC book.usp_insertCategory @category, @category_id = @category_ID OUTPUT

    SET @category_ID = (SELECT id FROM book.category WHERE category_name = @category)
    END

    BEGIN --Insere e retorna id da serie da qual o livro pertence
        IF NOT EXISTS(SELECT id FROM book.book_serie WHERE serie_name = @book_serie)
           EXEC book.usp_insertBookSerie @book_serie

    SET @bookserie_ID = (SELECT id FROM book.book_serie WHERE serie_name = @book_serie)
    END

    BEGIN -- Insere a linguagem do livro, e a linguagem original
    IF NOT EXISTS(SELECT 1 FROM book.language WHERE language_name = @language)
        EXEC book.usp_insertLanguage @language

    IF NOT EXISTS(SELECT 1 FROM book.language WHERE language_name = @original_language)
        EXEC book.usp_insertLanguage @original_language

    SET @language_ID = (SELECT id FROM book.language WHERE language_name = @language)
    SET @original_language_ID = (SELECT id FROM book.language WHERE language_name = @original_language)
    END

    BEGIN -- insere o tradutor do livro
       IF NOT EXISTS(SELECT 1 FROM book.translator WHERE translator_name = @translator)
            EXEC book.usp_insertTranslator @translator
       SET @translator_ID = (SELECT id FROM book.translator WHERE translator_name = @translator)
    END

    BEGIN -- insere editora
        IF NOT EXISTS(SELECT 1 FROM country WHERE country_name = @publisherCountry)
            EXEC usp_insertCountry @publisherCountry
        SET @publisherCountry_ID = (SELECT id FROM country WHERE country_name = @publisherCountry)

        IF NOT EXISTS(SELECT 1 FROM book.publisher WHERE publisher_name = @publisher AND country_id = @publisherCountry_ID)
            EXEC book.usp_insertPublisher @publisher, @publisherCountry_ID
        SET @publisher_ID = (SELECT 1 FROM book.publisher WHERE publisher_name = @publisher AND country_id = @publisherCountry_ID)
    END



    BEGIN --Inserindo um livro
        INSERT INTO book.book (
                                title,
                                pages,
                                edition,
                                ISBN13,
                                ISBN10,
                                published_at,
                                first_published_at,
                                first_published_era,
                                category_id,
                                book_serie_id,
                                language_id,
                                original_language_id,
                                original_country_id,
                                translator_id,
                                format_id,
                                size_id,
                                publisher_id
                               )
        VALUES (
                    @title,
                    @pages,
                    @edition,
                    @ISBN13,
                    @ISBN10,
                    @published_at,
                    @first_published_at,
                    @first_published_era,
                    @category_ID,
                    @bookserie_ID,
                    @language_ID,
                    @original_language_ID,
                    @original_country_ID,
                    @translator_ID,
                    (SELECT id FROM book.format WHERE format_name = @format),
                    (SELECT id FROM book.size WHERE size_name = @size),
                    @publisher_ID
               )
    END


    BEGIN --relaciona livro ao autor
        IF NOT EXISTS(SELECT 1 FROM country WHERE country_name = @author_country)
            EXEC usp_insertCountry @author_country
        SET @author_country_ID = (SELECT 1 FROM country WHERE country_name = @author_country)

        IF NOT EXISTS(SELECT 1 FROM book.author WHERE author_name = @author AND country_id = @author_country_ID)
            EXEC book.usp_insertAuthor @author, @author_country_ID, @author_nobelPrize

        SET @book_ID = (SELECT id FROM book.book WHERE ISBN13 = @ISBN13)

        INSERT INTO book.book_author VALUES(@book_ID, @author_ID)
    END

    BEGIN -- Relaciona livro a uma premiaco

        IF @award IS NOT NULL
            BEGIN
            IF NOT EXISTS(SELECT 1 FROM award WHERE award_name = @award)
                EXEC book.usp_insertAward @award
            SET @award_ID = (SELECT id FROM book.award WHERE award_name = @award)

            INSERT INTO book.book_award VALUES(@book_ID, @award_ID)
            END
    END
END
GO