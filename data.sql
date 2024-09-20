USE books_db;
GO


INSERT INTO country (country_name)
VALUES ('Brazil'), ('EUA');

INSERT INTO format (format_name)
VALUES('Paperback'), ('Hardcover'), ('E-book'), ('Audiobook'), ('Loose Leaf'), ('Spiral-bound'),
      ('Board Book');
GO

INSERT INTO size (size_name)
VALUES ('Regular'), ('Pocket');
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
    ('Horror'), ('Humor'), ('Law'), ('Literary Fiction'), ('Mystery'), ('Nonfiction'),
    ('Poetry'), ('Short Story'), ('Science'), ('Science Fiction'), ('Social Science'),
    ('Sports & Outdoors'), ('Thriller'), ('Travel');
GO

INSERT INTO person (nickname, first_name, last_name, email)
VALUES  ('Tiago', N'Tiago André', 'Fialho', 'tiago_asf@icloud.com'),
        ('Biazinha', 'Fabiana', N'Magalhães Barbosa', 'biazinhaa2@hotmail.com');
GO

INSERT INTO condition(condition_name)
VALUES  ('New'), ('Used');
GO

INSERT INTO acquisition_type(acquisition_type_name)
VALUES ('Online'), ('Physical'), ('Gift');
GO

/* Dados necessários 1

1. Livro
titulo: Onde os velhos não têm vez
autor: Cormac McCarthy EUA
Editora: Alfaguara Brasil
tradução: Adriana Lisboa
2a Edição 2023
Original 2005
Paginas: 229
linguagem: português
lingua_original: inglesa
não é série
sem prêmios
categoria: literary fiction
formato: paperback
tamanho: regular

2. aquisicao
tipo: online
Loja: amazon BR
Novo
comprador: Tiago
comprado em 17 de julho de 24
preco R$ 41,71

3. Leitura
Leitor tiago
inicio 15 de setembro de 24
fim 20 de setembro de 24
avaliacao 4
favorito
sem comentários

*/

/* Dados necessários 2

1. Livro
titulo: O senhor dos anéis
autor: J.R.R. Tolkien Inglaterra
Editora: Harper Collins Brasil
tradução: Ronald Kyrmse
1a Edição 2021
Original 1954
Paginas: 1373
linguagem: português
lingua_original: inglesa
serie: O senhor dos Anéis
sem prêmios
categoria: fantasy
formato: hardcover
tamanho: regular

2. aquisicao
tipo: online
Loja: amazon BR
Novo
comprador: Tiago
comprado em 30 de junho de 24
preco R$ 158,47

3. Leitura
Leitor tiago
inicio 15 de setembro de 24
fim 20 de setembro de 24
avaliacao 4
favorito
sem comentários
*/




-- SETEMBRO

INSERT INTO language(language_name)
VALUES ('Portuguese')

INSERT INTO format(format_name)
VALUES ('Paperback')

INSERT INTO country(country_name)
VALUES ('Brazil')

SELECT * FROM country
INSERT INTO publisher(name, country)
VALUES ('Alfaguara', 1);

INSERT INTO size (size_name)
VALUES ('Regular');

INSERT INTO author (name, nationality, is_nobel_prize_winner)
VALUES ('Cormac McCarthy', 2, 0);







