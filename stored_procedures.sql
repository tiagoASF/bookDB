-- =======================================================
-- sp_include_book for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 09/19/2024
-- Description: Include a book on database
-- =============================================

CREATE PROCEDURE sp_include_book(
    @title NVARCHAR(100),
    @ISBN13 CHAR(13),
    @ISBN10 CHAR(10) = NULL,
    @pages SMALLINT,
    @language VARCHAR(50),
    @original_language VARCHAR(50),
    @edition TINYINT,
    @publisher VARCHAR(50),
    @published_at CHAR(4),
    @first_published_at VARCHAR(10),
    @book_serie INT = NULL,
    @category VARCHAR(50),
    @size VARCHAR(50) = NULL,
    @translator NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS(SELECT )
        BEGIN

        END
    ELSE
    /*1.verificar se o titulo ainda nao existe (nome e isbn, se isbn10 não nulo)
    2. verifica language
    3. verifica original_language
    4. verifica book_serie se não nulo
    5. verifica category
    6. verifica size se não nulo
    7. verifica translator



    Inserir:
    1.page
    2.edition
    3.published_at
    4.first_published_at

    retorna mensagem de exito*/


END
GO

/*INSERT INTO MovieHasTrailer
    SELECT movieID, name
    FROM (SELECT @movieID as movieID, @name as name) t
    WHERE NOT EXISTS (SELECT 1
                      FROM MovieHasTrailer mht
                      WHERE mht.MovieId = t.MovieID AND mht.name = t.name
                     );*/

/*CREATE PROCEDURE [dbo].[RDPrintedPassbook]
	@col1 NCHAR(10),
	@Branch NVARCHAR(50),
	@InvstAc NVARCHAR(50),
	@InvstName NVARCHAR(120),
	@NameTitle NCHAR(10),
	@PassBookStatus NCHAR(10),
	@col5 NCHAR(10),
	@col6 NCHAR(10),
	@UserIP NCHAR(10),
	@RecordDateTime DATETIME
AS
	BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT InvstAc FROM GPNL_InvstPassbookStatus WHERE InvstAc = @InvstAc)
      BEGIN
            SELECT -1 -- Username exists.
      END
      ELSE
	INSERT INTO dbo.GPNL_InvstPassbookStatus(
		col1, Branch, InvstAc, InvstName, NameTitle, PassBookStatus, col5, col6, UserIP, RecordDateTime
	)
	VALUES(
		@col1, @Branch, @InvstAc, @InvstName, @NameTitle, @PassBookStatus, @col5, @col6, @UserIP, @RecordDateTime
	)
END
GO*/

/*REATE Procedure Insert_Update_Data
@EmpID int, @EmpName varchar(100), @Tech varchar(100)
AS
BEGIN
IF EXISTS (SELECT 1 FROM Employees WHERE EmployeeID=@EmpID)
    BEGIN
        UPDATE Employees Set  Technology=@Tech where EmployeeID=@EmpID
    END
    ELSE
    BEGIN
        INSERT into Employees Values (@EmpName,@Tech)
    END
END*/




/*sp_register_a_acquiring();

sp_start_reading_a_book();

sp_finish_a_book();*/