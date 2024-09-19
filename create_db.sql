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
VALUES ('Portuguese'), ('English'), ('Spanish')
GO

CREATE TABLE location
(
    id SMALLINT IDENTITY(1,1),
    country VARCHAR(50) NOT NULL,
    CONSTRAINT PK_country_id PRIMARY KEY(id),
    CONSTRAINT UQ_country_name UNIQUE(country)
);
CREATE INDEX IX_country_name ON location(country)
GO

CREATE TABLE author
(
    id INT IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    nationality_id SMALLINT NOT NULL,
    is_nobel_prize_winner BIT,
    CONSTRAINT PK_author_id PRIMARY KEY(id),
    CONSTRAINT FK_nationality_country
        FOREIGN KEY(nationality_id) REFERENCES location(id),
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
        FOREIGN KEY(location_id) REFERENCES location(id),
    CONSTRAINT UQ_publisher_name UNIQUE(name)
);
CREATE INDEX IX_publisher_name ON author(name);
GO





