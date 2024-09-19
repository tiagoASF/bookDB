USE books_db;
GO

CREATE TABLE language
(
    id SMALLINT IDENTITY(1,1),
    language_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_language_id PRIMARY KEY(id),
    CONSTRAINT UQ_language_name UNIQUE(language_name)
);
CREATE INDEX IX_language_name ON language(language_name);

INSERT INTO language (language_name)
VALUES ('Portuguese'), ('English'), ('Spanish'), ('French')
GO

CREATE TABLE country
(
    id SMALLINT IDENTITY(1,1),
    country_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_country_id PRIMARY KEY(id),
    CONSTRAINT UQ_country_name UNIQUE(country_name)
);
CREATE INDEX IX_country_name ON country(country_name)
GO

CREATE TABLE author
(
    id INT IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    nationality_id SMALLINT NOT NULL,
    is_nobel_prize_winner BIT,
    CONSTRAINT PK_author_id PRIMARY KEY(id),
    CONSTRAINT FK_nationality_country
        FOREIGN KEY(nationality_id) REFERENCES country(id),
    CONSTRAINT UQ_author_name UNIQUE(name)
);
CREATE INDEX IX_author_name ON author(name);
GO

CREATE TABLE publisher
(
    id INT IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    location_id SMALLINT NOT NULL,
    CONSTRAINT PK_publisher_id PRIMARY KEY(id),
    CONSTRAINT FK_publisher_country
        FOREIGN KEY(location_id) REFERENCES country(id),
    CONSTRAINT UQ_publisher_name UNIQUE(name)
);
CREATE INDEX IX_publisher_name ON author(name);
GO

CREATE TABLE format
(
    id SMALLINT IDENTITY(1,1),
    format_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_format_id PRIMARY KEY(id),
    CONSTRAINT UQ_format_name UNIQUE(format_name)
);
CREATE INDEX IX_format_name ON format(format_name);

INSERT INTO format (format_name)
VALUES('Paperback'), ('Hardcover'), ('Ebook'), ('Audiobook'), ('Loose Leaf'), ('Spiral-bound'),
      ('Board Book')
GO

CREATE TABLE book_serie
(
    id SMALLINT IDENTITY(1,1),
    serie_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_book_serie_id PRIMARY KEY(id),
    CONSTRAINT UQ_serie_name UNIQUE(serie_name)
);
CREATE INDEX IX_book_serie_name ON book_serie(serie_name)
GO

CREATE TABLE award
(
    id SMALLINT IDENTITY(1,1),
    award_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_award_id PRIMARY KEY(id),
    CONSTRAINT UQ_award_name UNIQUE(award_name)
);
CREATE INDEX IX_award_name ON award(award_name);

INSERT INTO award
VALUES  ('Booker Prize'), ('Caldecott Medal'), ('Eisner Award'), ('Hugo Award'), ('Nebula Award'),
        ('National Book Award'), ('Newbery Medal'), ('Pulitzer Price')
GO

CREATE TABLE category
(
    id SMALLINT IDENTITY(1,1),
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_category_id PRIMARY KEY(id),
    CONSTRAINT UQ_category_name UNIQUE(category_name)
);
CREATE INDEX IX_category_name ON category(category_name);

INSERT INTO category
VALUES
    ('Art & Photography'), ('Biography'), ('Business & Money'), ('Childrens Book'),
    ('Cookbook, Food & Wine'), ('Comics & Graphic Novel'), ('Computer & Technology'),
    ('Fantasy'), ('Health, Fitness & Dieting'), ('Historical Fiction'), ('History'),
    ('Horror'), ('Humor'), ('Law'), ('Literally Fiction'), ('Mystery'), ('Nonfiction'),
    ('Poetry'), ('Short Story'), ('Science'), ('Science Fiction'), ('Social Science'),
    ('Sports & Outdoors'), ('Thriller'), ('Travel')
GO













