﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		MAG
-- Create date: 2011-08-15
-- Description:	отч
-- =============================================
CREATE PROCEDURE [dbo].[о_жур_гр]
-- Add the parameters for the stored procedure here
@дата_нач DATE,
@дата_кон DATE
AS
  BEGIN
      SET NOCOUNT ON;

      IF EXISTS (SELECT
                   *
                 FROM
                   sys.objects
                 WHERE  object_id = Object_id(N'[dbo].[я_жур_гр]')
                    AND TYPE IN ( N'U' ))
        DROP TABLE [dbo].я_жур_гр

      DECLARE @sel VARCHAR(MAX)

      SET @sel = 'N'+'

      SELECT
        рег,
        CONVERT(DATE, дата_зае) AS дата_зае,
        CONVERT(DATE, дата_вые) AS дата_вые,
        ФИО,
        рожд_дата,
        НОМ,
        dbo.Фс_фио_лат(кли_код) AS фио_лат,
        dbo.Фс_фам_ио(кли_код) AS фам_ио,
        dbo.Фс_адр_имя(кли_код) AS адр_имя,
        dbo.Фс_паспорт(кли_код) AS паспорт,
        dbo.Фс_виза(счет_код, кли_код) AS виза,
        dbo.Фс_страх(счет_код, кли_код) AS страх,
        dbo.Фс_мигр(счет_код, кли_код) AS мигр,
        dbo.Фс_гра(счет_код, кли_код) AS гран,
        dbo. Фс_дата_отч_с_по(@дата_нач, @дата_кон) AS дата_отч_с_по
      INTO   я_жур_гр
      FROM
        во_жур_гр_ин
      WHERE  ( дата_зае_дата >= @дата_нач
           AND дата_зае_дата <= @дата_кон
           AND гражд_код = 1 )
      ORDER  BY
        рег,
        дата_зае'

 exec(@sel)
 
 
  END
/*
  WHERE ( case when гражд_код = 1 then ( дата_зае_дата >= @дата_нач
           AND дата_зае_дата <= @дата_кон AND гражд_код = 1) 
  else ( дата_зае_дата >= @дата_нач
           AND дата_зае_дата <= @дата_кон AND гражд_код <> 1)end )
  */
/*
пас_вид_имя,
  пас_номер,
  пас_дата,
  пас_выдан,
  стр_имя,
  цель_имя,
  ном_код,
  дата_вые,
  виза_вид_имя,
  виза_сер,
  виза_номер,
  виза_дата_с,
  виза_дата_по,
  страх_кем_имя,
  страх_номер,
  страх_дата_с,
  страх_дата_по,
  гра_дата,
  гра_имя,
*/
GO