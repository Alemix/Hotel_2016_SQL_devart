SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[пара_счет_и]
(
	@счет_код int
)
AS
	SET NOCOUNT OFF;

    UPDATE [пара]
    SET    [счет_код] = @счет_код
GO