USE books_db;
GO

INSERT INTO language (language_name)
VALUES ('Portuguese'), ('English'), ('Spanish'), ('French');
GO

INSERT INTO format (format_name)
VALUES('Paperback'), ('Hardcover'), ('E-book'), ('Audiobook'), ('Loose Leaf'), ('Spiral-bound'),
      ('Board Book')
GO

INSERT INTO size (size_name)
VALUES ('Regular'), ('Pocket')
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

INSERT INTO person (nickname, first_name, last_name, email)
VALUES  ('Tiago', N'Tiago André', 'Fialho', 'tiago_asf@icloud.com'),
        ('Biazinha', 'Fabiana', N'Magalhães Barbosa', 'biazinhaa2@hotmail.com')
GO

INSERT INTO condition(condition_name)
VALUES  ('New'), ('Used');
GO

INSERT INTO acquisition_type(acquisition_type_name)
VALUES ('Online'), ('Physical'), ('Gift'), ('Antiquarian');
GO
