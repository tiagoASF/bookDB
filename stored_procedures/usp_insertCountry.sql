USE BooksDB;
GO

IF OBJECT_ID('usp_insertCountry', 'P') IS NOT NULL
	DROP PROCEDURE usp_insertCountry;
GO

-- =======================================================
-- Create Stored Procedure usp_insertCountry
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Tiago Fialho
-- Create Date: 10/20/2024
-- Description: Insert a country in dbo.country.
-- =============================================
CREATE PROCEDURE usp_insertCountry (
    @countryName nvarchar(50)
)
AS
BEGIN

SET NOCOUNT ON

INSERT INTO country
	VALUES(@countryName)

END
GO

/*DECLARE @newcountry_id INT;
EXEC usp_insertCountry 'South Korea', @country_id = @newcountry_id OUTPUT
SELECT @newcountry_id;
GO*/
