USE books_db;
GO

INSERT INTO TA_format (format_name)
VALUES('Paperback'), ('Hardcover'), ('E-book'), ('Audiobook'), ('Loose Leaf'), ('Spiral-bound'),
      ('Board Book');
GO

INSERT INTO TA_size (size_name)
VALUES ('Regular'), ('Pocket');
GO

INSERT INTO TA_award
VALUES  ('Booker Prize'), ('Caldecott Medal'), ('Eisner Award'), ('Hugo Award'), ('Nebula Award'),
        ('National Book Award'), ('Newbery Medal'), ('Pulitzer Price')
GO

INSERT INTO TA_category
VALUES
    ('Art & Photography'), ('Biography'), ('Business & Money'), ('Childrens Book'),
    ('Cookbook, Food & Wine'), ('Comics & Graphic Novel'), ('Computer & Technology'),
    ('Fantasy'), ('Health, Fitness & Dieting'), ('Historical Fiction'), ('History'),
    ('Horror'), ('Humor'), ('Law'), ('Literary Fiction'), ('Mystery'), ('Nonfiction'),
    ('Poetry'), ('Short Story'), ('Science'), ('Science Fiction'), ('Social Science'),
    ('Sports & Outdoors'), ('Thriller'), ('Travel');
GO

INSERT INTO TA_condition(condition_name)
VALUES  ('New'), ('Used');
GO

INSERT INTO TA_acquisition_type(acquisition_type_name)
VALUES ('Online'), ('Physical'), ('Gift');
GO

INSERT INTO TA_country
VALUES ('Brazil'), ('United States'), ('England'), ('France'), ('Portugal'),
       ('Italy'), ('Germany'), ('Japan')






