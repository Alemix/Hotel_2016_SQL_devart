﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[пара_н]
(
	@комп_код int,
	@дата_зае_г datetime,
	@дата_вые_г datetime,
	@сут_г int,
	@тип_зае_код_г int,
	@кол_взр_г int,
	@цель_код_г int,
	@ски_код_г int,
	@ски_про_г int,
	@счет_код_г int
	
)
AS
	SET NOCOUNT OFF;
INSERT INTO [пара] ([комп_код], [дата_зае_г], [дата_вые_г], [сут_г], [тип_зае_код_г], [кол_взр_г], [цель_код_г], [ски_код_г], [ски_про_г], [счет_код_г]) VALUES (@комп_код, @дата_зае_г, @дата_вые_г, @сут_г, @тип_зае_код_г, @кол_взр_г, @цель_код_г, @ски_код_г, @ски_про_г, @счет_код_г);
GO