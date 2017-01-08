SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- Печаль рублей и копеек в конце
CREATE FUNCTION [dbo].[фс_сумма_пропись_РубКоп] (@Num_all NUMERIC(18, 2))
RETURNS VARCHAR(255)
AS
  BEGIN
      DECLARE @Num BIGINT

      SET @Num = @Num_all

      DECLARE @nword        VARCHAR(255),
              @nword_all    VARCHAR(255),
             @wrub VARCHAR(10) = ' рублей ' ,
		   @wkop VARCHAR(10) = ' копеек ',
		    @th           TINYINT,
              @gr           SMALLINT,
              @d3           TINYINT,
              @d2           TINYINT,
              @d1           TINYINT,
              @IsMaleGender SMALLINT
      -- копейки
      DECLARE @Kop INT = 0

      SET @kop = Isnull(( @Num_all - @Num ) * 100, 0)

      IF @Num < 0
        RETURN '*** Ошибка: Неправильное число'
      ELSE IF @Num = 0
        RETURN 'Ноль'

      WHILE @Num > 0
             OR @kop > 0
        BEGIN
            IF @Num > 0
              BEGIN
                  SET @th = Isnull(@th, 0) + 1
                  SET @gr = @Num % 1000
                  SET @Num = ( @Num - @gr ) / 1000
                  SET @IsMaleGender = 1 -- для рублей мужской орд
              END
            ELSE
              -- копейки --
              BEGIN
                  SET @th = 99
                  SET @gr = @Kop
                  SET @Kop = 0
                  SET @IsMaleGender = 0 -- для рублей мужской орд
              END

            IF @gr > 0
              BEGIN
                  SET @d3 = ( @gr - @gr % 100 ) / 100
                  SET @d1 = @gr % 10
                  SET @d2 = ( @gr - @d3 * 100 - @d1 ) / 10

                  IF @d2 = 1
                    SET @d1 = 10 + @d1

                  SET @nword = CASE @d3 WHEN 1 THEN ' сто' WHEN 2 THEN ' двести' WHEN 3 THEN ' триста' WHEN 4 THEN ' четыреста' WHEN 5 THEN ' пятьсот' WHEN 6 THEN ' шестьсот' WHEN 7 THEN ' семьсот' WHEN 8 THEN ' восемьсот' WHEN 9 THEN ' девятьсот' ELSE '' END + CASE @d2 WHEN 2 THEN ' двадцать' WHEN 3 THEN ' тридцать' WHEN 4 THEN ' сорок' WHEN 5 THEN ' пятьдесят' WHEN 6 THEN ' шестьдесят' WHEN 7 THEN ' семьдесят' WHEN 8 THEN ' восемьдесят' WHEN 9 THEN ' девяносто' ELSE '' END + CASE @d1 WHEN 1 THEN ( CASE WHEN @th = 2 OR ( (@th = 1 OR @th = 99) AND @IsMaleGender = 0 ) THEN ' одна' ELSE ' один' END ) WHEN 2 THEN ( CASE WHEN @th = 2 OR ( (@th = 1 OR @th = 99) AND @IsMaleGender = 0 ) THEN ' две' ELSE ' два' END ) WHEN 3 THEN ' три' WHEN 4 THEN ' четыре' WHEN 5 THEN ' пять' WHEN 6 THEN ' шесть' WHEN 7 THEN ' семь' WHEN 8 THEN ' восемь' WHEN 9 THEN ' девять' WHEN 10 THEN ' десять' WHEN 11 THEN ' одиннадцать' WHEN 12 THEN ' двенадцать' WHEN 13 THEN ' тринадцать' WHEN 14 THEN ' четырнадцать'
                               WHEN
                               15
                               THEN
                               ' пятнадцать' WHEN
                               16 THEN ' шестнадцать' WHEN 17 THEN ' семнадцать' WHEN 18 THEN ' восемнадцать' WHEN 19 THEN ' девятнадцать' ELSE '' END + CASE @th WHEN 2 THEN ' тысяч' + ( CASE WHEN @d1 = 1 THEN 'а' WHEN @d1 IN ( 2, 3, 4 ) THEN 'и' ELSE '' END ) WHEN 3 THEN ' миллион' WHEN 4 THEN ' миллиард' WHEN 5 THEN ' триллион' WHEN 6 THEN ' квадрилион' WHEN 7 THEN ' квинтилион' ELSE '' END + CASE WHEN @th IN ( 3, 4, 5, 6, 7 ) THEN ( CASE WHEN @d1 = 1 THEN '' WHEN @d1 IN ( 2, 3, 4 ) THEN 'а' ELSE 'ов' END ) ELSE '' END
                 
			 
			  if @th <> 99
			  set @wrub = CASE WHEN @d1 = 1   THEN ' рубль ' WHEN @d1 in(2,3,4)   THEN ' рубля ' WHEN @d1 > 2 or @d1 = 0  then ' рублей ' END
			  
			   if @th = 99
			  set @wkop = CASE WHEN @d1 = 1   THEN ' копейка ' WHEN @d1 in(2,3,4)   THEN ' копейки ' WHEN @d1 > 2 or @d1 = 0 then ' копеек ' END
		

			   SET @nword_all = CASE
                                     WHEN @Num <= 0
                                          AND @th = 99 THEN
                                       Isnull(@nword_all, '') + isnull(@wrub, '')                                   

                                       + Isnull(@nword, '') + isnull(@wkop, '')
                                     WHEN @Num = 0
                                          AND @kop = 0 THEN
                                       Isnull(@nword, '') + Isnull(@nword_all, '')
                                       +    isnull(@wrub, '') + ' ноль копеек'
                                     ELSE
                                       Isnull(@nword, '') + Isnull(@nword_all, '')
                                   END
              END
        END

      RETURN Upper(Substring(@nword_all, 2, 1))
             + Substring(@nword_all, 3, Len(@nword_all) - 2)
  END

/*
исходы
есть копейки и надо их


*/
GO