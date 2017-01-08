SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create  PROCEDURE [dbo].[пара_опер_и]
(
	@опер_код int
)
AS
	SET NOCOUNT OFF;

    UPDATE [пара]
    SET    [опер_код] = @опер_код
GO