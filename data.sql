USE books_db;
GO

INSERT INTO language (language_name)
VALUES ('Portuguese'), ('English'), ('Spanish'), ('French');
GO

INSERT INTO format (format_name)
VALUES('Paperback'), ('Hardcover'), ('Ebook'), ('Audiobook'), ('Loose Leaf'), ('Spiral-bound'),
      ('Board Book');
GO

INSERT INTO award
VALUES  ('Booker Prize'), ('Caldecott Medal'), ('Eisner Award'), ('Hugo Award'), ('Nebula Award'),
        ('National Book Award'), ('Newbery Medal'), ('Pulitzer Price')
GO

INSERT INTO category
VALUES
    ('Art & Photography'), ('Biography'), ('Business & Money'), ('Childrens Book'),
    ('Cookbook, Food & Wine'), ('Comics & Graphic Novel'), ('Computer & Technology'),
    ('Fantasy'), ('Health, Fitness & Dieting'), ('Historical Fiction'), ('History'),
    ('Horror'), ('Humor'), ('Law'), ('Literally Fiction'), ('Mystery'), ('Nonfiction'),
    ('Poetry'), ('Short Story'), ('Science'), ('Science Fiction'), ('Social Science'),
    ('Sports & Outdoors'), ('Thriller'), ('Travel')
GO