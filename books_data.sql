
/*--------------------------------------
BOOK 01
______________________________________*/

INSERT INTO book.language
VALUES ('Portuguese'), ('English')
GO

INSERT INTO book.publisher (publisher_name, country_id)
VALUES ('Alfaguara', (SELECT id FROM country WHERE country_name = 'Brazil'));

INSERT INTO book.translator
VALUES (N'Adriana Lisboa')

INSERT INTO book.author(author_name, country_id, is_nobel_prize_winner)
VALUES (
        'Cormac McCarthy',
        (SELECT id FROM country WHERE country_name = 'United States'),
        0
       )

INSERT INTO book.book (title,
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
        N'Onde os velhos não têm vez',
        229,
        1,
        '978-8556522061',
        '8556522068',
        '2023',
        '2005',
        NULL,
        (SELECT id FROM book.category WHERE category_name = 'Literary Fiction'),
        NULL,
        (SELECT id FROM book.language WHERE language_name = 'Portuguese'),
        (SELECT id FROM book.language WHERE language_name = 'English'),
        (SELECT id FROM country WHERE country_name = 'United States'),
        (SELECT id FROM book.translator WHERE translator_name = 'Adriana Lisboa'),
        (SELECT id FROM book.format WHERE format_name = 'Paperback'),
        (SELECT id FROM book.size WHERE size_name = 'Regular'),
        (SELECT id FROM book.publisher WHERE publisher_name = 'Alfaguara')
   )
GO

INSERT INTO book.book_author
VALUES (
        (SELECT id FROM book.book WHERE ISBN13 = '978-8556522061'),
        (SELECT id FROM book.author WHERE author_name = 'Cormac McCarthy')
       )

/*INSERT INTO book.book_award
VALUES();
GO*/

-- ACQUISITION


INSERT INTO acquisition.store
VALUES ('Amazon', 1)

INSERT INTO acquisition.info
(
    book_id, acquirer_id, condition_id, acquisition_type_id, acquired_at, purchase_price, store_id
)
VALUES (
        (SELECT id FROM book.book WHERE ISBN13 = '978-8556522061'),
        (SELECT id FROM person WHERE email = 'tiago_asf@icloud.com'),
        (SELECT id FROM acquisition.condition WHERE condition_name = 'New'),
        (SELECT id FROM acquisition.type WHERE type_name = 'Online'),
        '2024-07-17',
        4171,
        (SELECT id FROM acquisition.store WHERE store_name = 'Amazon' AND country_id = 1)
       )
GO

INSERT INTO book.book_publisher
VALUES (
        (SELECT id FROM book.book WHERE ISBN13 = '978-8556522061'),
        (SELECT id FROM book.publisher WHERE publisher_name = 'Alfaguara')
       )

-- 3. READING

INSERT INTO reading.info (book_id, reader_id, is_finished, rating, comments, is_favorite, started_at, finished_at)
VALUES (
            (SELECT id FROM book.book WHERE ISBN13 = '978-8556522061'),
            (SELECT id FROM person WHERE email = 'tiago_asf@icloud.com'),
            1,
            3,
            NULL,
            1,
            '2024-09-15',
            '2024-09-20'
       )


/*--------------------------------------
BOOK 02
______________________________________*/


INSERT INTO book.publisher (publisher_name, country_id)
VALUES ('Harper Collins Brasil', (SELECT id FROM country WHERE country_name = 'Brazil'));

INSERT INTO book.translator
VALUES (N'Ronald Kyrmse')

INSERT INTO book.author(author_name, country_id, is_nobel_prize_winner)
VALUES (
        'J.R.R. Tolkien',
        (SELECT id FROM country WHERE country_name = 'England'),
        0
       )

INSERT INTO book.book (title,
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
        N'O Senhor dos Anéis - Edição de Colecionador com Ilustrações de Alan Lee',
        1376,
        1,
        '978-6555112511',
        '6555112514',
        '2024',
        '1954',
        NULL,
        (SELECT id FROM book.category WHERE category_name = 'Fantasy'),
        NULL,
        (SELECT id FROM book.language WHERE language_name = 'Portuguese'),
        (SELECT id FROM book.language WHERE language_name = 'English'),
        (SELECT id FROM country WHERE country_name = 'England'),
        (SELECT id FROM book.translator WHERE translator_name = N'Ronald Kyrmse'),
        (SELECT id FROM book.format WHERE format_name = 'Hardcover'),
        (SELECT id FROM book.size WHERE size_name = 'Regular'),
        (SELECT id FROM book.publisher WHERE publisher_name = 'Harper Collins Brasil')
   )
GO

/*INSERT INTO book.book_award
VALUES();
GO*/

-- ACQUISITION


INSERT INTO acquisition.store
VALUES ('Amazon', 1)

INSERT INTO acquisition.info
(
    book_id, acquirer_id, condition_id, acquisition_type_id, acquired_at, purchase_price, store_id
)
VALUES (
        (SELECT id FROM book.book WHERE ISBN13 = '978-6555112511'),
        (SELECT id FROM person WHERE email = 'tiago_asf@icloud.com'),
        (SELECT id FROM acquisition.condition WHERE condition_name = 'New'),
        (SELECT id FROM acquisition.type WHERE type_name = 'Online'),
        '2024-07-17',
        15847,
        (SELECT id FROM acquisition.store WHERE store_name = 'Amazon' AND country_id = 1)
       )
GO

INSERT INTO book.book_publisher
VALUES (
        (SELECT id FROM book.book WHERE ISBN13 = '978-6555112511'),
        (SELECT id FROM book.publisher WHERE publisher_name = 'Harper Collins Brasil')
       )

INSERT INTO book.book_author
VALUES(
       (SELECT id FROM book.book WHERE ISBN13 = '978-6555112511'),
       (SELECT id FROM book.author WHERE author_name = 'J.R.R. Tolkien')
      )
GO

SELECT * FROM book.book_author

-- 3. READING

INSERT INTO reading.info (book_id, reader_id, is_finished, rating, comments, is_favorite, started_at, finished_at)
VALUES (
            (SELECT id FROM book.book WHERE ISBN13 = '978-6555112511'),
            (SELECT id FROM person WHERE email = 'tiago_asf@icloud.com'),
            0,
            5,
            'A sociedade do anel foi lido entre 15 de setembro de 24 e 20 de setembro de 24',
            1,
            '2024-09-15',
            NULL
       )

