USE books_db;
GO

CREATE TABLE language
(
    id INT IDENTITY(1,1),
    language_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_language_id PRIMARY KEY(id),
    CONSTRAINT UQ_language_name UNIQUE(language_name)
);
CREATE INDEX IX_language_name ON language(language_name);

CREATE TABLE country
(
    id INT IDENTITY(1,1),
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
    nationality_id INT NOT NULL,
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
    country_id INT NOT NULL,
    CONSTRAINT PK_publisher_id PRIMARY KEY(id),
    CONSTRAINT FK_publisher_country
        FOREIGN KEY(country_id) REFERENCES country(id),
    CONSTRAINT UQ_publisher_name UNIQUE(name)
);
CREATE INDEX IX_publisher_name ON author(name);
GO

CREATE TABLE format
(
    id INT IDENTITY(1,1),
    format_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_format_id PRIMARY KEY(id),
    CONSTRAINT UQ_format_name UNIQUE(format_name)
);
CREATE INDEX IX_format_name ON format(format_name);
GO

CREATE TABLE size
(
    id INT IDENTITY(1,1),
    size_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_size_id PRIMARY KEY(id),
    CONSTRAINT UQ_size_name UNIQUE(size_name)
);
CREATE INDEX IX_size_name ON size(size_name)
GO

CREATE TABLE book_serie
(
    id INT IDENTITY(1,1),
    serie_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_book_serie_id PRIMARY KEY(id),
    CONSTRAINT UQ_serie_name UNIQUE(serie_name)
);
CREATE INDEX IX_book_serie_name ON book_serie(serie_name)
GO

CREATE TABLE award
(
    id INT IDENTITY(1,1),
    award_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_award_id PRIMARY KEY(id),
    CONSTRAINT UQ_award_name UNIQUE(award_name)
);
CREATE INDEX IX_award_name ON award(award_name);
GO

CREATE TABLE category
(
    id INT IDENTITY(1,1),
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_category_id PRIMARY KEY(id),
    CONSTRAINT UQ_category_name UNIQUE(category_name)
);
CREATE INDEX IX_category_name ON category(category_name);
GO

CREATE TABLE person
(
    id INT IDENTITY(1,1),
    nickname NVARCHAR(50),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50),
    email VARCHAR(320) NOT NULL,
    is_active BIT DEFAULT '1',
    CONSTRAINT PK_person_id PRIMARY KEY(id),
    CONSTRAINT UQ_person_name UNIQUE(first_name, last_name),
    CONSTRAINT UQ_person_nickname UNIQUE(nickname),
    CONSTRAINT UQ_person_email UNIQUE(email),
);
GO


CREATE TABLE condition
(
    id INT IDENTITY(1,1),
    condition_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_condition_id PRIMARY KEY(id),
    CONSTRAINT UQ_condition_name UNIQUE(condition_name)
);
CREATE INDEX IX_condition_name ON condition(condition_name);
GO

CREATE TABLE acquisition_type
(
    id INT IDENTITY(1,1),
    acquisition_type_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_acquisition_type_id PRIMARY KEY(id),
    CONSTRAINT UQ_acquisition_type_name UNIQUE(acquisition_type_name)
);
CREATE INDEX IX_acquisition_type_name ON acquisition_type(acquisition_type_name);
GO

CREATE TABLE store
(
    id INT IDENTITY(1,1),
    store_name VARCHAR(50),
    country_id INT NOT NULL,
    CONSTRAINT PK_store_id PRIMARY KEY(id),
    CONSTRAINT UQ_store_name UNIQUE(store_name),
    CONSTRAINT FK_store_country
        FOREIGN KEY(country_id) REFERENCES country(id)
);
CREATE INDEX IX_store_name ON store(store_name);
GO

CREATE TABLE translator
(
    id INT IDENTITY(1,1),
    name NVARCHAR(50),
    CONSTRAINT PK_translator_id PRIMARY KEY(id),
    CONSTRAINT UQ_translator_name UNIQUE(name)
);
CREATE INDEX IX_translator_name ON translator(name);
GO

CREATE TABLE book
(
    id INT IDENTITY(1,1),
    title NVARCHAR(100) NOT NULL,
    pages SMALLINT NOT NULL,
    language_id INT NOT NULL,
    original_language_id INT NOT NULL,
    original_country_id INT NOT NULL,
    edition TINYINT NOT NULL,
    publisher_id INT NOT NULL,
    published_at CHAR(4) NOT NULL,
    first_published_at VARCHAR(10) NOT NULL,
    book_serie_id INT NOT NULL,
    category_id INT NOT NULL,
    size_id INT NOT NULL,
    translator_id INT NOT NULL,
    ISBN13 CHAR(13) NOT NULL,
    ISBN10 CHAR(10),
    CONSTRAINT PK_book_id PRIMARY KEY(id),
    CONSTRAINT FK_book_language
        FOREIGN KEY(language_id) REFERENCES language(id),
     CONSTRAINT FK_book_publisher
        FOREIGN KEY(publisher_id) REFERENCES publisher(id),
    CONSTRAINT FK_book_original_language
        FOREIGN KEY(original_language_id) REFERENCES language(id),
    CONSTRAINT FK_book_original_country
        FOREIGN KEY(original_country_id) REFERENCES country(id),
    CONSTRAINT FK_book_serie
        FOREIGN KEY(book_serie_id) REFERENCES book_serie(id),
    CONSTRAINT FK_book_category
        FOREIGN KEY(category_id) REFERENCES category(id),
    CONSTRAINT FK_book_size
        FOREIGN KEY(size_id) REFERENCES size(id),
    CONSTRAINT FK_book_translator
        FOREIGN KEY(translator_id) REFERENCES translator(id),
    CONSTRAINT UQ_isbn13 UNIQUE(ISBN13)
);
CREATE INDEX IX_title ON book(title);
GO



CREATE TABLE book_author
(
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT PK_book_author PRIMARY KEY(book_id, author_id)
);

CREATE TABLE book_publisher
(
    book_id INT NOT NULL,
    publisher_id INT NOT NULL,
    CONSTRAINT PK_book_publisher PRIMARY KEY(book_id, publisher_id)
);

CREATE TABLE book_award
(
    book_id INT NOT NULL,
    award_id INT NOT NULL,
    CONSTRAINT PK_book_award PRIMARY KEY(book_id, award_id)
);
GO

CREATE TABLE reading_info
(
    id INT IDENTITY(1,1),
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    is_started BIT,
    is_finished BIT,
    rating CHAR(1) NOT NULL,
    comments VARCHAR(300),
    is_favorite BIT DEFAULT '0',
    CONSTRAINT PK_reading_info PRIMARY KEY(id),
    CONSTRAINT FK_reading_info_book
        FOREIGN KEY(book_id) REFERENCES book(id),
    CONSTRAINT FK_reading_info_reader
        FOREIGN KEY(reader_id) REFERENCES person(id),
    CONSTRAINT CHK_book_rating CHECK (rating >= 1 AND rating <= 5)
);

CREATE TABLE period
(
    id INT IDENTITY(1,1),
    started_at DATE NOT NULL,
    finished_at DATE NOT NULL,
    comments VARCHAR(100),
    CONSTRAINT PK_period PRIMARY KEY(id)
);
GO

CREATE TABLE reading_period
(
    reading_info_id INT NOT NULL,
    period_id INT NOT NULL,
    CONSTRAINT PK_reading_period PRIMARY KEY(reading_info_id, period_id)
);
GO

CREATE TABLE acquisition_info
(
    id INT IDENTITY(1,1),
    book_id INT NOT NULL,
    acquirer_id INT NOT NULL,
    condition_id INT NOT NULL,
    acquisition_type_id INT NOT NULL,
    acquired_at DATE DEFAULT GETDATE(),
    purchase_price INT NOT NULL,
    store_id INT NOT NULL,
    CONSTRAINT PK_acquisition_info PRIMARY KEY(id),
    CONSTRAINT FK_acquisition_info_book
        FOREIGN KEY(book_id) REFERENCES book(id),
    CONSTRAINT FK_acquisition_info_acquirer
        FOREIGN KEY(acquirer_id) REFERENCES person(id),
    CONSTRAINT FK_acquisition_info_condition
        FOREIGN KEY(condition_id) REFERENCES condition(id),
    CONSTRAINT FK_acquisition_info_type
        FOREIGN KEY(acquisition_type_id) REFERENCES acquisition_type(id),
    CONSTRAINT FK_acquisition_info_store
        FOREIGN KEY(store_id) REFERENCES store(id),
);



