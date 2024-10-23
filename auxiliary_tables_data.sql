USE books_db;
GO

INSERT INTO book.format (format_name)
VALUES('Paperback'), ('Hardcover'), ('E-book'), ('Audiobook'), ('Loose Leaf'), ('Spiral-bound'),
      ('Board Book');
GO

INSERT INTO book.size (size_name)
VALUES ('Regular'), ('Pocket');
GO

INSERT INTO book.award
VALUES  ('Booker Prize'), ('Caldecott Medal'), ('Eisner Award'), ('Hugo Award'), ('Nebula Award'),
        ('National Book Award'), ('Newbery Medal'), ('Pulitzer Price')
GO

INSERT INTO book.category
VALUES
    ('Art & Photography'), ('Biography'), ('Business & Money'), ('Childrens Book'),
    ('Cookbook, Food & Wine'), ('Comics & Graphic Novel'), ('Computer & Technology'),
    ('Fantasy'), ('Health, Fitness & Dieting'), ('Historical Fiction'), ('History'),
    ('Horror'), ('Humor'), ('Law'), ('Literary Fiction'), ('Mystery'), ('Nonfiction'),
    ('Poetry'), ('Short Story'), ('Science'), ('Science Fiction'), ('Social Science'),
    ('Sports & Outdoors'), ('Thriller'), ('Travel'), ('Classic Literature');
GO

INSERT INTO acquisition.condition(condition_name)
VALUES  ('New'), ('Used');
GO

INSERT INTO acquisition.type(type_name)
VALUES ('Online'), ('Physical'), ('Gift');
GO

INSERT INTO country
VALUES ('Brazil'), ('United States'), ('England'), ('France'), ('Portugal'),
       ('Italy'), ('Germany'), ('Japan')

INSERT INTO person
VALUES ('Tiago', 'Tiago', 'Fialho', 'tiago_asf@icloud.com', 1)

INSERT INTO person
VALUES ('Bia', 'Fabiana', N'Magalhães Barbosa', 'biazinhaa2@hotmail.com', 1)





