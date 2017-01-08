SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фс_рег_пров]
(
	@опер_код  int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @рег_пров int
	DECLARE @гражд_код int


	 SELECT
          @гражд_код = Isnull(кли.гражд_код, 0)
        FROM
          опер
        LEFT OUTER JOIN кли
          ON опер.кли_код = кли.кли_код
        WHERE       опер.опер_код = @опер_код
/* 
if @опер_код  = 	@опер_код_нач 

	 SELECT
          @рег_пров = рег
        FROM
          опер
        WHERE      опер.опер_код = @опер_код
else
*/
	 SELECT
          @рег_пров = Isnull(MAX(Isnull(опер.рег_пров, 0)), 0) + 1
        FROM
          опер
        LEFT OUTER JOIN кли
          ON опер.кли_код = кли.кли_код
        WHERE           ( Isnull(кли.гражд_код, 0) =@гражд_код )
                    AND YEAR(дата_зае) = YEAR(Getdate()) -- только текущий год 
 
	
	-- Return the result of the function
	RETURN @рег_пров

END
GO