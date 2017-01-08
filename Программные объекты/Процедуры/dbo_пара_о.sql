SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[пара_о]
AS
	SET NOCOUNT ON;
SELECT     комп_код, дата_зае_г, дата_вые_г, сут_г, тип_зае_код_г, кол_взр_г, цель_код_г, ски_код_г, ски_про_г, счет_код_г

FROM         пара
GO