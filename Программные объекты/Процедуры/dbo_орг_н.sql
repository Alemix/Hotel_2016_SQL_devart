﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[орг_н]
(
	@орг_имя varchar(300),
	@орг_имя_кор varchar(300),
	@орг_имя_пол varchar(300),
	@преамбула varchar(300),
	@счет_номер char(30),
	@счет_банк char(30),
	@счет_мфо char(30),
	@унп char(15),
	@адрес varchar(100),
	@город char(30),
	@стр_код int,
	@рук_фио_кор char(30),
	@рук_фио_пол char(30),
	@рук_должность char(30),
	@дейст_на_осн varchar(300),
	@тел_рук char(50),
	@контакт_фио char(30),
	@тел_контакт char(50),
	@тел_гор char(15),
	@тел_факс char(15),
	@тел_velcom char(15),
	@тел_mtc char(15),
	@тел_life char(15),
	@е_маил char(30)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [орг] ([орг_имя], [орг_имя_кор], [орг_имя_пол], [преамбула], [счет_номер], [счет_банк], [счет_мфо], [унп], [адрес], [город], [стр_код], [рук_фио_кор], [рук_фио_пол], [рук_должность], [дейст_на_осн], [тел_рук], [контакт_фио], [тел_контакт], [тел_гор], [тел_факс], [тел_Velcom], [тел_MTC], [тел_Life], [е_маил]) VALUES (@орг_имя, @орг_имя_кор, @орг_имя_пол, @преамбула, @счет_номер, @счет_банк, @счет_мфо, @унп, @адрес, @город, @стр_код, @рук_фио_кор, @рук_фио_пол, @рук_должность, @дейст_на_осн, @тел_рук, @контакт_фио, @тел_контакт, @тел_гор, @тел_факс, @тел_Velcom, @тел_MTC, @тел_Life, @е_маил);
	
SELECT орг_код, орг_имя, орг_имя_кор, орг_имя_пол, преамбула, счет_номер, счет_банк, счет_мфо, унп, адрес, город, стр_код, рук_фио_кор, рук_фио_пол, рук_должность, дейст_на_осн, тел_рук, контакт_фио, тел_контакт, тел_гор, тел_факс, тел_Velcom, тел_MTC, тел_Life, е_маил FROM орг WHERE (орг_код = SCOPE_IDENTITY())
GO