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
    @publisherCountry VARCHAR(50)
) AS
BEGIN
    SET NOCOUNT ON

    DECLARE @original_country_ID INT;
    DECLARE @category_ID INT;
    DECLARE @language_ID INT;
    DECLARE @translator_ID INT;
    DECLARE @publisher_ID INT;
    DECLARE @bookserie_ID INT;
    DECLARE @author_ID INT;

    BEGIN --Insere e retorna id do país de origem do livro
    IF NOT EXISTS(SELECT id FROM country WHERE country_name = @original_country)
        EXEC dbo.usp_insertCountry @original_country, @country_id = @original_country_ID OUTPUT
    ELSE
        SET @original_country_ID = (SELECT id FROM country WHERE country_name = @original_country)
    END

    BEGIN --Insere e retorna id da categoria do livro
    IF NOT EXISTS(SELECT id FROM book.category WHERE category_name = @category)
        EXEC book.usp_insertCategory @category, @category_id = @category_ID OUTPUT
    ELSE
        SET @category_ID = (SELECT id FROM book.category WHERE category_name = @category)
    END

    BEGIN --Insere e retorna id da serie da qual o livro pertence
        IF NOT EXISTS(SELECT id FROM book.book_serie WHERE serie_name = @book_serie)
           EXEC book.usp_insertBookSerie @book_serie
        SET @bookserie_ID = (SELECT id FROM book.book_serie WHERE serie_name = @book_serie)
    END





    BEGIN
        INSERT INTO book.book (
                                title,
                                pages,
                                edition,
                                ISBN13,
                                ISBN10,
                                published_at,
                                first_published_at,
                                first_publisher_era,
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
                    xxx,
                    xxx,
                    xxx,
                    country_ID,
                    xxx,
                    (SELECT id FROM book.format WHERE format_name = @format),
                    (SELECT id FROM book.size WHERE size_name = @size),
                    xxx
               )
    END





    BEGIN
        INSERT INTO book.book_author
    END

    BEGIN
        INSERT INTO book.book_prize
    END














END
GO