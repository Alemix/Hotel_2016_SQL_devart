SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		МАГ
-- Create date: 2011-06-27
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[фс_док_счф] (
-- Add the parameters for the function here
@хоз_код INT)
RETURNS INT
AS
  BEGIN
      -- Declare the return variable here
      DECLARE @док INT

      SELECT
        @док = Isnull(MAX(счф.счф_док), 0)  + 1
      FROM
        дог
      LEFT OUTER JOIN счф
        ON Isnull(дог.дог_код, 0) = Isnull(счф.дог_код, 0)
      WHERE           ( Isnull(дог.дог_хоз, 0) = @хоз_код )

   AND YEAR(Isnull(счф_дата, CONVERT(DATE, ''))) = YEAR(Getdate()) --   номер в текущем году

      -- Return the result of the function
      RETURN Isnull(@док, 0)
  END
GO